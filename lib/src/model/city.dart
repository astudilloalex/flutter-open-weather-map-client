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

// /// City detailed information
// class City {
//   /// Country to which the city belongs.
//   final Country? country;

//   /// The current weather of the city.
//   ///
//   /// This is null if not loaded current weather.
//   final Weather? currentWeather;

//   /// This is null if not loaded five day forecast.
//   final List<Weather>? fiveDayForecast;

//   /// City ID used by Open Weather Map.
//   final int? id;

//   /// City geo location, latitude.
//   final double latitude;

//   /// City geo location, longitude.
//   final double longitude;

//   /// City name.
//   final String? name;

//   /// Population obtained from Open Weather Map, may not be exact.
//   final int? population;

//   /// Sunrise time.
//   final DateTime? sunrise;

//   /// Sunset time.
//   final DateTime? sunset;

//   /// Timezone in seconds.
//   ///
//   /// For example GTM -05:00 is -18000
//   final int? timezone;

//   /// Define a City class.
//   const City({
//     this.country,
//     this.currentWeather,
//     this.fiveDayForecast,
//     this.id,
//     required this.latitude,
//     required this.longitude,
//     this.name,
//     this.population,
//     this.sunrise,
//     this.sunset,
//     this.timezone,
//   });

//   /// Returns a City with [currentWeather] parsed from [json].
//   factory City.fromCurrentWeather(Map<String, dynamic> json) {
//     return City(
//       country: Country.fromCode(json['sys']['country'] as String),
//       currentWeather: Weather.fromJson(json),
//       id: json['id'] as int?,
//       latitude: double.parse(json['coord']['lat'].toString()),
//       longitude: double.parse(json['coord']['lon'].toString()),
//       name: json['name'] as String?,
//       population: json['population'] as int?,
//       sunrise: DateTime.fromMillisecondsSinceEpoch(
//         json['sys']['sunrise'] * 1000 as int,
//       ),
//       sunset: DateTime.fromMillisecondsSinceEpoch(
//         json['sys']['sunset'] * 1000 as int,
//       ),
//       timezone: json['timezone'] as int,
//     );
//   }

//   /// Returns a city with [fiveDayForecast] list parsed from [json].
//   factory City.fromFiveDayForecast(Map<String, dynamic> json) {
//     final List<Map<String, dynamic>> forecast =
//         json['list'] as List<Map<String, dynamic>>;
//     return City(
//       country: Country.fromCode(json['sys']['country'] as String),
//       fiveDayForecast: List<Weather>.from(
//         forecast.map<Weather>((weather) => Weather.fromJson(weather)),
//       ),
//       id: json['id'] as int?,
//       latitude: double.parse(json['coord']['lat'].toString()),
//       longitude: double.parse(json['coord']['lon'].toString()),
//       name: json['name'] as String?,
//       population: json['population'] as int?,
//       sunrise: DateTime.fromMillisecondsSinceEpoch(
//         json['sys']['sunrise'] * 1000 as int,
//       ),
//       sunset: DateTime.fromMillisecondsSinceEpoch(
//         json['sys']['sunset'] * 1000 as int,
//       ),
//       timezone: json['timezone'] as int,
//     );
//   }
// }
