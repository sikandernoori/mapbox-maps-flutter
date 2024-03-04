import Flutter
import Foundation
import MapboxMaps
import UIKit

public class OfflineDownloader: NSObject {
    var tileStore: TileStore?
    var cancelables = Set<AnyCancelable>()
    lazy var offlineManager: OfflineManager = {
        return OfflineManager()
    }()
    private var offlineRegionManager: OfflineRegionManager!
    var offlineRegion: OfflineRegion!
    var styleDownloads: [Cancelable] = []
    var regionDownloads: [Cancelable] = []
    let progressKeys = ["completedResourceCount", "completedResourceSize", "requiredResourceCount", "loadedResourceSize", "loadedResourceCount", "erroredResourceCount"]
    
    

    func downloadStylePack(progressEventSink: FlutterEventSink?, mapStyleUrI: String) {
        precondition(styleDownloads.isEmpty)
        
        let stylePackLoadOptions = StylePackLoadOptions(glyphsRasterizationMode: .ideographsRasterizedLocally, metadata: ["tag": "my-outdoors-style-pack"])!
        
        let stylePackDownload = offlineManager.loadStylePack(for: StyleURI(rawValue: mapStyleUrI)!, loadOptions: stylePackLoadOptions) { progress in
            let progressDict = progress.dictionaryWithValues(forKeys: self.progressKeys)
            progressEventSink?(progressDict)
        } completion: { res in
            switch res {
            case .success(let stylePack):
                progressEventSink?(FlutterEndOfEventStream)
                self.styleDownloads = []
                
            case .failure(let error):
                progressEventSink?(FlutterError(code: "1", message: error.localizedDescription, details: error.localizedDescription))
                self.styleDownloads = []
            }
        }
        
        styleDownloads = [stylePackDownload]
    }
    
    func downloadTileRegions(bounds: CoordinateBounds, progressEventSink: FlutterEventSink?, tileRegionId: String, minZoom: Double, maxZoom: Double, useDepreciated: Bool, mapStyleUrI: String, flutterResult: @escaping FlutterResult) {
        self.tileStore = TileStore.default
        guard let tileStore = tileStore else {
            preconditionFailure()
        }
        
        precondition(regionDownloads.isEmpty)
        
        // Create an offline region with tiles for the outdoors style
        let outdoorsOptions = TilesetDescriptorOptions(styleURI: .outdoors, zoomRange: UInt8(minZoom.rounded())...UInt8(maxZoom.rounded()), tilesets: nil)
        let outdoorsDescriptor = offlineManager.createTilesetDescriptor(for: outdoorsOptions)
        let coordinates = [ bounds.southwest, bounds.northwest, bounds.northeast, bounds.southeast, bounds.southwest ]
        //        let coordinates = [
        //            CLLocationCoordinate2D(latitude: 59.322857, longitude: 24.599779),
        //            CLLocationCoordinate2D(latitude: 59.467006, longitude: 24.596907),
        //            CLLocationCoordinate2D(latitude: 59.484485, longitude: 24.985024),
        //            CLLocationCoordinate2D(latitude: 59.332018, longitude: 25.017349),
        //            CLLocationCoordinate2D(latitude: 59.322857, longitude: 24.599779),
        //        ]
        
        if(useDepreciated) {
            let offlineRegionDef = OfflineRegionGeometryDefinition(
                styleURL: mapStyleUrI,
                geometry: .polygon(Polygon([coordinates])),
                minZoom: minZoom,
                maxZoom: maxZoom,
                pixelRatio: Float(UIScreen.main.scale),
                glyphsRasterizationMode: .noGlyphsRasterizedLocally
            )

            // Please note: this uses a deprecated API and will be removed in the future.
            offlineRegionManager = OfflineRegionManager()

            offlineRegionManager.createOfflineRegion(for: offlineRegionDef) { [weak self] result in
                switch result {
                case let .failure(error):
                    progressEventSink?(FlutterError(code: "1", message: error.localizedDescription, details: error.localizedDescription))

                case let .success(region):
                    let observer = OfflineRegionExampleObserver { [weak self] (status) in
                        guard let self = self else {
                            return
                        }
                        
                        let progressDict = [
                            "completedResourceCount": status.completedResourceCount,
                            "completedResourceSize": status.completedResourceSize,
                            "requiredResourceCount": status.requiredTileCount,
                            "loadedResourceSize": status.completedResourceSize,
                            "loadedResourceCount": status.completedResourceCount,
                            "erroredResourceCount": 0
                        ]
                        progressEventSink?(progressDict)

                        if status.downloadState == .inactive {
                            progressEventSink?(FlutterEndOfEventStream)
                        }
                    }
                    self?.offlineRegion = region
                    self?.offlineRegion.setOfflineRegionObserverFor(observer)
                    self?.offlineRegion.setOfflineRegionDownloadStateFor(.active)
                }
            }
        } else {
            let tileRegionLoadOptions = TileRegionLoadOptions(
                geometry: Geometry(Polygon([coordinates])),
                descriptors: [outdoorsDescriptor],
                metadata: nil,
                acceptExpired: false,
                networkRestriction: .none)!
            
            let tileRegionDownload = tileStore.loadTileRegion(forId: tileRegionId, loadOptions: tileRegionLoadOptions) { progress in
                flutterResult(nil)
                let progressDict = progress.dictionaryWithValues(forKeys: self.progressKeys)
                progressEventSink?(progressDict)
            } completion: { result in
                switch result {
                case .success(let tileRegion):
                    progressEventSink?(FlutterEndOfEventStream)
                    self.regionDownloads = []

                case .failure(let error as MapboxMaps.TileRegionError):
                    switch error {
                        case .tileCountExceeded:
                        flutterResult(FlutterError(code: "limit-exceed", message: error.failureReason, details: error.localizedDescription))
                            self.regionDownloads = []
                        default:
                            break
                        }
                    
                case .failure(let error):
                    progressEventSink?(FlutterError(code: "1", message: error.localizedDescription, details: error.localizedDescription))
                    self.regionDownloads = []
                }
            }
            
            regionDownloads = [tileRegionDownload]
        }
    }
}

final class OfflineRegionExampleObserver: OfflineRegionObserver {

    private let statusChanged: (OfflineRegionStatus) -> Void

    init(statusChanged: @escaping (OfflineRegionStatus) -> Void) {
        self.statusChanged = statusChanged
    }

    func statusChanged(for status: OfflineRegionStatus) {
        statusChanged(status)
    }

    func errorOccurred(forError error: OfflineRegionError) {
        // Some errors are considered recoverable and will be retried
        if error.isFatal {
            print("Offline resource download fatal error: The region cannot proceed downloading of any resources and it will be put to inactive state.")
        } else {
            print("Offline resource download error: \(error.type), \(error.message)")
        }
    }

    func mapboxTileCountLimitExceeded(forLimit limit: UInt64) {
        print("Mapbox tile count max (\(limit)) has been exceeded!")
    }
}
