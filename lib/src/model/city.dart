import 'package:open_weather_map_client/open_weather_map_client.dart';
import 'package:open_weather_map_client/src/model/coordinates.dart';

/// City information.
class City {
  /// Define a [City] class.
  const City({
    this.coordinates,
    this.country,
    this.id,
    this.name,
    this.population,
    this.timezone = 0,
  }) : assert(
          coordinates != null || name != null || id != null,
          'The coordinates, id or name of the city can not be null.',
        );

  /// City geolocation.
  final Coordinates? coordinates;

  /// Country to which the city belongs.
  ///
  /// It may not be exact when fetching it from the API.
  final Country? country;

  /// City ID used by Open Weather Map.
  final int? id;

  /// City name.
  final String? name;

  /// Population obtained from Open Weather Map, may not be exact.
  final int? population;

  /// Timezone in seconds.
  ///
  /// For example GTM -05:00 is -18000
  final int timezone;

  /// Factory that returns a [City] class from [json] Map.
  factory City.fromJson(Map<String, dynamic> json) {
    final int time = json['timezone'] == null
        ? json['timezone_offset'] as int
        : json['timezone'] as int;
    final String? countryCode = json['country'] as String?;
    return City(
      coordinates: Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
      country: countryCode != null ? Country.fromCode(countryCode) : null,
      id: json['id'] as int?,
      name: json['name'] as String?,
      population: json['population'] as int?,
      timezone: time,
    );
  }
}
