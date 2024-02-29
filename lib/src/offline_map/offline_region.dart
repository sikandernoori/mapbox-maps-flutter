class OfflineRegion {
  final String id;
  final DateTime? expires;
  final int completedResourceSize;
  final int completedResourceCount;

  OfflineRegion({
    required this.id,
    this.expires,
    required this.completedResourceSize,
    required this.completedResourceCount,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'expires': expires?.millisecondsSinceEpoch,
        'completedResourceSize': completedResourceSize,
        'completedResourceCount': completedResourceCount,
      };

  factory OfflineRegion.fromMap(Map map) {
    if (map['id'] == null || map['id'] is! String) {
      throw ArgumentError('Missing or invalid id in map');
    }
    if (map['completedResourceSize'] == null ||
        map['completedResourceSize'] is! int) {
      throw ArgumentError('Missing or invalid completedResourceSize in map');
    }
    if (map['completedResourceCount'] == null ||
        map['completedResourceCount'] is! int) {
      throw ArgumentError('Missing or invalid completedResourceCount in map');
    }

    DateTime? expires;
    if (map['expires'] != null) {
      final int milliseconds = map['expires'] as int;
      expires = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    }

    return OfflineRegion(
      id: map['id'] as String,
      expires: expires,
      completedResourceSize: map['completedResourceSize'] as int,
      completedResourceCount: map['completedResourceCount'] as int,
    );
  }
}
