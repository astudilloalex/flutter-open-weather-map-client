/// Coordinates class to get the geographic location.
class Coordinates {
  /// Define a [Coordinates] class.
  const Coordinates(this.latitude, this.longitude);

  /// Latitude of the geographic coordinate system.
  final double latitude;

  /// Longitude of the geographic coordinate system.
  final double longitude;

  /// Factory that returns a [Coordinates] class from [json] Map.
  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      double.parse(json['lat'].toString()),
      double.parse(json['lon'].toString()),
    );
  }
}
