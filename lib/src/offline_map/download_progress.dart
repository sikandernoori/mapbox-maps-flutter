part of mapbox_maps_flutter;

class DownloadProgress {
  int completedResourceCount;
  int completedResourceSize;
  int requiredResourceCount;
  int loadedResourceSize;
  int loadedResourceCount;
  int erroredResourceCount;

  DownloadProgress({
    this.completedResourceCount = 0,
    this.completedResourceSize = 0,
    this.requiredResourceCount = 0,
    this.loadedResourceSize = 0,
    this.loadedResourceCount = 0,
    this.erroredResourceCount = 0,
  });

  factory DownloadProgress.fromMap(Map<String, dynamic> map) {
    return DownloadProgress(
      completedResourceCount: map['completedResourceCount'],
      completedResourceSize: map['completedResourceSize'],
      requiredResourceCount: map['requiredResourceCount'],
      loadedResourceSize: map['loadedResourceSize'],
      loadedResourceCount: map['loadedResourceCount'],
      erroredResourceCount: map['erroredResourceCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'completedResourceCount': completedResourceCount,
      'completedResourceSize': completedResourceSize,
      'requiredResourceCount': requiredResourceCount,
      'loadedResourceSize': loadedResourceSize,
      'loadedResourceCount': loadedResourceCount,
      'erroredResourceCount': erroredResourceCount,
    };
  }
}
