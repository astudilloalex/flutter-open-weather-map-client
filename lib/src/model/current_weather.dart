import 'package:open_weather_map_client/open_weather_map_client.dart';
import 'package:open_weather_map_client/src/model/condition.dart';
import 'package:open_weather_map_client/src/model/detail.dart';
import 'package:open_weather_map_client/src/model/rain.dart';
import 'package:open_weather_map_client/src/model/wind.dart';

/// Current weather information.
class CurrentWeather {
  /// Define a [CurrentWeather] class.
  const CurrentWeather({
    required this.city,
    this.cloudiness,
    required this.conditions,
    required this.dateTime,
    required this.detail,
    this.rain,
    required this.sunrise,
    required this.sunset,
    this.visibility,
    required this.wind,
  });

  /// City information.
  final City city;

  /// Cloudiness, in % (percentage).
  final int? cloudiness;

  /// Weather conditions information (Rain, Snow, etc).
  ///
  /// Most of the time the list only has one item.
  final List<Condition> conditions;

  /// Time of data calculation.
  final DateTime dateTime;

  /// Details of the weather (temperature, pressure, etc).
  final Detail detail;

  /// Rain information.
  final Rain? rain;

  /// Sunrise time.
  final DateTime sunrise;

  /// Sunset time.
  final DateTime sunset;

  /// Average visibility, metres.
  final int? visibility;

  /// Wind information.
  final Wind wind;

  /// Factory that returns the
  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> city = {
      'coord': json['coord'],
      'country': json['sys']['country'],
      'id': json['id'],
      'name': json['name'],
      'timezone': json['timezone'],
    };
    return CurrentWeather(
      city: City.fromJson(city),
      cloudiness: json['clouds']['all'] as int?,
      conditions: (json['weather'] as List<dynamic>).map<Condition>(
        (condition) {
          return Condition.fromJson(condition as Map<String, dynamic>);
        },
      ).toList(),
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000 as int),
      detail: Detail.fromJson(json['main'] as Map<String, dynamic>),
      rain: json['rain'] != null
          ? Rain.fromJson(json['rain'] as Map<String, dynamic>)
          : null,
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        json['sys']['sunrise'] * 1000 as int,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(
        json['sys']['sunset'] * 1000 as int,
      ),
      visibility: json['visibility'] as int?,
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
    );
  }

  /// Returns a map of the class formatted as it comes from the API.
  Map<String, dynamic> toJson() {
    return {
      'clouds': {'all': cloudiness},
      'coord': city.coordinates?.toJson(),
      'dt': dateTime.millisecondsSinceEpoch ~/ 1000,
      'id': city.id,
      'main': detail.toJson(),
      'name': city.name,
      'rain': rain?.toJson(),
      'sys': {
        'country': city.country?.code,
        'sunrise': sunrise.millisecondsSinceEpoch ~/ 1000,
        'sunset': sunset.millisecondsSinceEpoch ~/ 1000,
      },
      'timezone': city.timezone,
      'visibility': visibility,
      'weather': List<dynamic>.from(conditions.map((cond) => cond.toJson())),
      'wind': wind.toJson(),
    };
  }
}
