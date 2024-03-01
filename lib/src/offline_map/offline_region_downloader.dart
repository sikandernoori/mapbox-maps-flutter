part of mapbox_maps_flutter;

enum ProgressOff { stylePack, region }

class MapDownloader {
  final MethodChannel _globalChannel = MethodChannel('mapbox_downloader');
  static const EventChannel _progressChannel =
      EventChannel('mapbox_downloader_progress');

  Future<List<OfflineStylePack>> getDownloadedStylePacks() async {
    List regionsMap = await _globalChannel.invokeMethod('getListOfStylePacks');
    return regionsMap
        .map((region) => OfflineStylePack.fromMap(region))
        .toList();
  }

  Future<List<OfflineRegion>> getListOfDownloadedRegions(
      {bool useDepreciated = false}) async {
    if (useDepreciated) {
      var directory = (await getApplicationSupportDirectory());
      var files =
          io.Directory(directory.absolute.path).listSync(recursive: true);
      for (var file in files) {
        if (file.path.contains("map_data.db")) {
          var stat = await file.stat();
          return [
            OfflineRegion(
              id: "1",
              completedResourceSize: stat.size,
              completedResourceCount: (stat.size ~/ 1024) ~/ 256,
            )
          ];
        }
      }
    }
    List regionsMap = await _globalChannel.invokeMethod('getListOfRegions',
        <String, dynamic>{'useDepreciated': useDepreciated});
    return regionsMap.map((region) => OfflineRegion.fromMap(region)).toList();
  }

  Future<dynamic> setOfflineTileCountLimit(int limit, {String? accessToken}) =>
      _globalChannel.invokeMethod(
        'setOfflineTileCountLimit',
        <String, dynamic>{
          'limit': limit,
          'accessToken': accessToken,
        },
      );

  Future<dynamic> deleteOfflineRegions(List<String> tileRegionIds) =>
      _globalChannel.invokeMethod('deleteOfflineRegion',
          <String, dynamic>{'tileRegionIds': tileRegionIds});

  static Stream<DownloadProgress> progressStream(ProgressOff progressOff) {
    return _progressChannel
        .receiveBroadcastStream(progressOff.index)
        .map((event) => Map<String, int>.from(event))
        .map((map) => DownloadProgress.fromMap(map));
  }

  Future<void> downloadOfflineStylePack(String mapStyleUrI) async {
    return await _globalChannel.invokeMethod('downloadOfflineStylePack',
        <String, dynamic>{'mapStyleUrI': mapStyleUrI});
  }

  Future<PlatformException?> downloadOfflineRegion(
      OfflineRegionDefinition definition,
      {Map<String, dynamic> metadata = const {},
      String? accessToken,
      bool useDepreciated = false}) async {
    try {
      await _globalChannel
          .invokeMethod('downloadOfflineRegion', <String, dynamic>{
        'accessToken': accessToken,
        'tileRegionId': definition.tileRegionId,
        'definition': definition.toMap(),
        'metadata': metadata,
        'useDepreciated': useDepreciated
      });

      return null;
    } on PlatformException catch (e) {
      return e;
    }
  }

  Future<void> cancelDownloads() async =>
      await _globalChannel.invokeMethod('cancelDownloads');
}
