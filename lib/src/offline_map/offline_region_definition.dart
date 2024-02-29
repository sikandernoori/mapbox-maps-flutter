part of mapbox_maps_flutter;

/// Description of region to be downloaded. Identifier will be generated when
/// the download is initiated.
class OfflineRegionDefinition {
  const OfflineRegionDefinition({
    this.tileRegionId = "main",
    required this.bounds,
    required this.mapStyleUrI,
    required this.minZoom,
    required this.maxZoom,
    this.includeIdeographs = false,
  });

  final String tileRegionId;
  final CoordinateBounds bounds;
  final String mapStyleUrI;
  final double minZoom;
  final double maxZoom;
  final bool includeIdeographs;

  @override
  String toString() =>
      "$runtimeType, bounds = $bounds, mapStyleUrI = $mapStyleUrI, minZoom = $minZoom, maxZoom = $maxZoom";

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bounds'] = bounds.toMap();
    data['mapStyleUrI'] = mapStyleUrI;
    data['minZoom'] = minZoom;
    data['maxZoom'] = maxZoom;
    data['includeIdeographs'] = includeIdeographs;
    return data;
  }

  factory OfflineRegionDefinition.fromMap(Map<String, dynamic> map) {
    return OfflineRegionDefinition(
      tileRegionId: map['tileRegionId'],
      bounds: CoordinateBounds.fromMap(map['bounds']),
      mapStyleUrI: map['mapStyleUrI'],
      minZoom: map['minZoom'].toDouble(),
      maxZoom: map['maxZoom'].toDouble(),
      includeIdeographs: map['includeIdeographs'] ?? false,
    );
  }
}
