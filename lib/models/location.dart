class Location {
  final double latitude;
  final double longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(dynamic json) {
    return Location(
      latitude: json['coord']['lat'].toDouble(),
      longitude: json['coord']['lon'].toDouble(),
    );
  }
}
