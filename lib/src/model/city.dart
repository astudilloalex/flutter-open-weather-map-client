import 'package:open_weather_map_client/src/model/country.dart';

/// City detailed information
class City {
  /// Country to which the city belongs.
  final Country? country;

  /// City ID used by Open Weather Map.
  final int id;

  /// City geo location, latitude.
  final double? latitude;

  /// City geo location, longitude.
  final double? longitude;

  /// City name.
  final String name;

  /// Population obtained from Open Weather Map, may not be exact.
  final int? population;

  /// Sunrise time.
  final DateTime sunrise;

  /// Sunset time.
  final DateTime sunset;

  City({
    this.country,
    required this.id,
    this.latitude,
    this.longitude,
    required this.name,
    this.population,
    required this.sunrise,
    required this.sunset,
  });
}
