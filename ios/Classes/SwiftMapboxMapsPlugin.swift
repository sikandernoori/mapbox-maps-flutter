import Flutter
import Foundation
import MapboxMaps
import UIKit

public class SwiftMapboxMapsPlugin: MapboxMapsPlugin {
    var stylePackProgressEventSink: FlutterEventSink?
    var regionProgressEventSink: FlutterEventSink?
    
    override public static func register(with registrar: FlutterPluginRegistrar) {
        let mapboxMapInstance = MapboxMapFactory(withRegistrar: registrar)
        registrar.register(mapboxMapInstance, withId: "plugins.flutter.io/mapbox_maps")
        
        let customCallsChannel = FlutterMethodChannel(name: "mapbox_downloader", binaryMessenger: registrar.messenger())
        let swiftMapboxMapsPluginInstance = SwiftMapboxMapsPlugin()
        registrar.addMethodCallDelegate(swiftMapboxMapsPluginInstance, channel: customCallsChannel)

        let offlineDownloader = OfflineDownloader()
        
        // Set stream handler for progress updates
        let progressChannel = FlutterEventChannel(name: "mapbox_downloader_progress", binaryMessenger: registrar.messenger())
        progressChannel.setStreamHandler(swiftMapboxMapsPluginInstance)

        customCallsChannel.setMethodCallHandler { methodCall, result in
            switch methodCall.method {
            case "downloadOfflineStylePack":
                guard let args = methodCall.arguments as? [String: Any],
                      let mapStyleUrI = args["mapStyleUrI"] as? String
                        
                else {
                    print(
                        "downloadOfflineStylePack unexpected arguments: \(String(describing: methodCall.arguments))"
                    )
                    result(nil)
                    return
                }
                
                offlineDownloader.downloadStylePack(progressEventSink: swiftMapboxMapsPluginInstance.stylePackProgressEventSink, mapStyleUrI: mapStyleUrI)
                result(nil)
            case "downloadOfflineRegion":
                guard let arguments = methodCall.arguments as? [String: Any],
                      let args = arguments["definition"] as? [String: Any],
                      let tileRegionId = arguments["tileRegionId"] as? String,
                      let minZoom = args["minZoom"] as? Double,
                      let maxZoom = args["maxZoom"] as? Double,
                      let bounds = args["bounds"] as? [String: Any],
                      let sw = bounds["southwest"] as? [String: Any],
                      let swCoordinates = sw["coordinates"] as? [Double],
                      let ne = bounds["northeast"] as? [String: Any],
                      let neCoordinates = ne["coordinates"] as? [Double],
                      let useDepreciated = arguments["useDepreciated"] as? Bool,
                      let mapStyleUrI = args["mapStyleUrI"] as? String
                else {
                    print(
                        "downloadOfflineRegion unexpected arguments: \(String(describing: methodCall.arguments))"
                    )
                    result(nil)
                    return
                }
                let swCoordinate = CLLocationCoordinate2D(latitude: swCoordinates[1], longitude: swCoordinates[0])
                let neCoordinate = CLLocationCoordinate2D(latitude: neCoordinates[1], longitude: neCoordinates[0])

                let coordinateBounds = CoordinateBounds(southwest: swCoordinate, northeast: neCoordinate)
                
                offlineDownloader.downloadTileRegions(bounds: coordinateBounds, progressEventSink: swiftMapboxMapsPluginInstance.regionProgressEventSink, tileRegionId: tileRegionId, minZoom: minZoom, maxZoom: maxZoom, useDepreciated: useDepreciated, mapStyleUrI: mapStyleUrI)
                result(nil)
            case "getListOfStylePacks":
                offlineDownloader.offlineManager.allStylePacks { res in
                    switch res {
                        case .success(let stylePacksDictionaryList):
                            let stylePacksMapList = stylePacksDictionaryList.map { sp -> [String: Any] in
                                return [
                                    "styleURI": sp.styleURI,
                                    "expires": sp.expires?.millisecondsSince1970,
                                    "completedResourceSize": sp.completedResourceSize,
                                    "completedResourceCount": sp.completedResourceCount,
                                ]
                            }
                            result(stylePacksMapList)
                        case .failure(let error):
                            result(FlutterError(code: "getListOfStylePacks", message: error.localizedDescription, details: error.localizedDescription))
                        }
                }
            case "getListOfRegions":
                guard let arguments = methodCall.arguments as? [String: Any],
                      let useDepreciated = arguments["useDepreciated"] as? Bool
                else {
                    print(
                        "getListOfRegions unexpected arguments: \(String(describing: methodCall.arguments))"
                    )
                    result(nil)
                    return
                }
                
                if(useDepreciated) {
                    var offlineRegionManager = OfflineRegionManager()
                    offlineRegionManager.offlineRegions { res in
                        switch res {
                        case let .success(tileRegions):
                            print(tileRegions)
                            let regionsMapList = tileRegions.map { (reg: OfflineRegion) -> [String: Any] in
                                print(reg)
                                return [
                                    "id": reg.getIdentifier(),
                                ]
                            }
                            result(regionsMapList)
                        case let .failure(error):
                            result(FlutterError(code: "getListOfRegions", message: error.localizedDescription, details: error.localizedDescription))
                        }
                    }
                } else {
                    
                    let tileStore = TileStore.default
                    tileStore.allTileRegions { res in
                        switch res {
                        case let .success(tileRegions):
                            let regionsMapList = tileRegions.map { region -> [String: Any] in
                                return [
                                    "id": region.id,
                                    "expires": region.expires?.millisecondsSince1970,
                                    "completedResourceSize": region.completedResourceSize,
                                    "completedResourceCount": region.completedResourceCount,
                                ]
                            }
                            result(regionsMapList)
                        case let .failure(error):
                            result(FlutterError(code: "getListOfRegions", message: error.localizedDescription, details: error.localizedDescription))
                        }
                    }
                }
            case "cancelDownloads":
                offlineDownloader.styleDownloads.forEach { $0.cancel() }
                offlineDownloader.regionDownloads.forEach { $0.cancel() }
                offlineDownloader.offlineRegion.setOfflineRegionDownloadStateFor(.inactive)
                result(nil)
            case "deleteOfflineRegion":
                guard let args = methodCall.arguments as? [String: Any],
                      let tileRegionIds = args["tileRegionIds"] as? [String]
                        
                else {
                    print(
                        "downloadOfflineRegion unexpected arguments: \(String(describing: methodCall.arguments))"
                    )
                    result(nil)
                    return
                }
                tileRegionIds.forEach { tileRegionId in
                    TileStore.default.removeTileRegion(forId: tileRegionId)
                }
                // Decide if diskQuota needs to be set to 0, to remove all tileRegions, but to run this make sure all regions are deleted, consider this delete all cahce use case
                // offlineDownloader.tileStore?.setOptionForKey(TileStoreOptions.diskQuota, value: 0)
                result(nil)
            case "deleteOfflinePack":
                guard let args = methodCall.arguments as? [String: Any],
                      let styleURI = args["styleURI"] as? String
                        
                else {
                    print(
                        "downloadOfflineRegion unexpected arguments: \(String(describing: methodCall.arguments))"
                    )
                    result(nil)
                    return
                }
                offlineDownloader.offlineManager.removeStylePack(for: StyleURI(rawValue: styleURI)!)
                result(nil)
            default:
                result(methodCall.method)
            }
        }
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}


extension SwiftMapboxMapsPlugin: FlutterStreamHandler {
    public func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
        if arguments as? Int == 0 {
            stylePackProgressEventSink = eventSink
        }

        if arguments as? Int == 1 {
            regionProgressEventSink = eventSink
        }

        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        if arguments as? Int == 0 {
            stylePackProgressEventSink = nil
        }

        if arguments as? Int == 1 {
            regionProgressEventSink = nil
        }

        return nil
    }
}
