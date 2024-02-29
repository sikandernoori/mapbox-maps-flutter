import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'page.dart';

class DownloadOfflineRegionPage extends ExamplePage {
  DownloadOfflineRegionPage()
      : super(const Icon(Icons.map), 'Download Offline Region Page');

  @override
  Widget build(BuildContext context) {
    return const DownloadOfflineRegionPageBody();
  }
}

class DownloadOfflineRegionPageBody extends StatefulWidget {
  const DownloadOfflineRegionPageBody();

  @override
  State<StatefulWidget> createState() => DownloadOfflineRegionPageBodyState();
}

class DownloadOfflineRegionPageBodyState
    extends State<DownloadOfflineRegionPageBody> {
  DownloadOfflineRegionPageBodyState();

  StreamSubscription<DownloadProgress>? stylePackDownloadStream;
  StreamSubscription<DownloadProgress>? regionDownloadStream;

  MapboxMap? mapboxMap;
  var mapProject = StyleProjectionName.globe;
  var locale = 'en';

  @override
  void dispose() {
    super.dispose();
    stylePackDownloadStream?.cancel();
    regionDownloadStream?.cancel();
  }

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
  }

  Widget _getStylePacks() {
    return TextButton(
      child: Text('Get downloaded style packs'),
      onPressed: () async {
        if (mapboxMap != null) {
          print((await MapDownloader().getDownloadedStylePacks())
              .map((e) => e.toMap())
              .toList());
        }
      },
    );
  }

  Widget _getDownloadedRegions() {
    return TextButton(
      child: Text('Get downloaded regions'),
      onPressed: () async {
        if (mapboxMap != null) {
          print((await MapDownloader()
                  .getListOfDownloadedRegions(useDepreciated: true))
              .map((e) => e.toMap())
              .toList());
        }
      },
    );
  }

  Widget _cancelDownloads() {
    return TextButton(
      child: Text('Cancel downloading'),
      onPressed: () async {
        if (mapboxMap != null) {
          await MapDownloader().cancelDownloads();
          print("Downloads cancelled");
        }
      },
    );
  }

  Widget _deleteRegions() {
    return TextButton(
      child: Text('Delete regions'),
      onPressed: () async {
        if (mapboxMap != null) {
          var availableRegions =
              await MapDownloader().getListOfDownloadedRegions();
          var tileRegionIds = availableRegions.map((e) => e.id).toList();
          await MapDownloader().deleteOfflineRegions(tileRegionIds);
          print("regions deleted");
        }
      },
    );
  }

  Widget _downloadStylePack() {
    return TextButton(
      child: Text('Download style pack'),
      onPressed: () async {
        if (mapboxMap != null) {
          stylePackDownloadStream =
              MapDownloader.progressStream(ProgressOff.stylePack).listen(
                  (progress) {
            print("Progress Style pack: ${progress.toMap()}");
          }, onDone: () {
            print("Download complete Style pack");
          }, onError: (error) {
            print("Error occured during downloading style pack: $error");
          });
          await MapDownloader()
              .downloadOfflineStylePack(MapboxStyles.SATELLITE);
        }
      },
    );
  }

  Widget _downloadRegion() {
    return TextButton(
      child: Text('Download region'),
      onPressed: () async {
        if (mapboxMap != null) {
          regionDownloadStream =
              MapDownloader.progressStream(ProgressOff.region).listen(
                  (progress) {
            print("Progress Region: ${progress.toMap()}");
          }, onDone: () {
            print("Download complete Region");
          }, onError: (error) {
            print("Error occured during downloading region pack: $error");
          });
          final cs = (await mapboxMap!.getCameraState());
          final bounds =
              (await mapboxMap!.coordinateBoundsForCamera(CameraOptions(
            bearing: cs.bearing,
            center: cs.center,
            padding: cs.padding,
            pitch: cs.pitch,
          )));
          var ne = Position.fromJson(
              (bounds.northeast["coordinates"] as Iterable)
                  .map((coord) => coord as num)
                  .toList());

          var sw = Position.fromJson(
              (bounds.southwest["coordinates"] as Iterable)
                  .map((coord) => coord as num)
                  .toList());

          var maanager =
              await mapboxMap!.annotations.createPolygonAnnotationManager();
          await maanager.create(PolygonAnnotationOptions(
              geometry: Polygon(coordinates: [
                [
                  sw,
                  Position(sw.lng, ne.lat),
                  ne,
                  Position(ne.lng, sw.lat),
                  sw,
                ]
              ]).toJson(),
              fillColor: Colors.red.withOpacity(0.3).value));
          await MapDownloader().downloadOfflineRegion(
            OfflineRegionDefinition(
              tileRegionId:
                  'Hamburg', // DateTime.now().millisecondsSinceEpoch.toString(),
              bounds: bounds,
              mapStyleUrI: MapboxStyles.OUTDOORS,
              minZoom: 0,
              maxZoom: 16,
            ),
            useDepreciated: false,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final MapWidget mapWidget = MapWidget(
      key: ValueKey("mapWidget"),
      cameraOptions: CameraOptions(
        center: Point(coordinates: Position(24.743791, 59.437668)).toJson(),
        zoom: 8,
        pitch: 0.0,
      ),
      onMapCreated: _onMapCreated,
    );

    final List<Widget> listViewChildren = <Widget>[];

    listViewChildren.addAll(
      <Widget>[
        _getStylePacks(),
        _getDownloadedRegions(),
        _downloadStylePack(),
        _downloadRegion(),
        _cancelDownloads(),
        _deleteRegions()
      ],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 400,
              child: mapWidget),
        ),
        Expanded(
          child: ListView(
            children: listViewChildren,
          ),
        )
      ],
    );
  }
}
