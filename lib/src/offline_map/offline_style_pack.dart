class OfflineStylePack {
  final String styleURI;
  final DateTime? expires;
  final int completedResourceSize;
  final int completedResourceCount;

  OfflineStylePack({
    required this.styleURI,
    this.expires,
    required this.completedResourceSize,
    required this.completedResourceCount,
  });

  Map<String, dynamic> toMap() => {
        'styleURI': styleURI,
        'expires': expires?.millisecondsSinceEpoch,
        'completedResourceSize': completedResourceSize,
        'completedResourceCount': completedResourceCount,
      };

  factory OfflineStylePack.fromMap(Map map) {
    if (map['styleURI'] == null || map['styleURI'] is! String) {
      throw ArgumentError('Missing or invalid styleURI in map');
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

    return OfflineStylePack(
      styleURI: map['styleURI'] as String,
      expires: expires,
      completedResourceSize: map['completedResourceSize'] as int,
      completedResourceCount: map['completedResourceCount'] as int,
    );
  }
}
