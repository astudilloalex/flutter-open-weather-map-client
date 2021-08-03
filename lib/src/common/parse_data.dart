import 'dart:convert';

import 'package:open_weather_map_client/src/model/city.dart';
import 'package:open_weather_map_client/src/model/country.dart';
import 'package:open_weather_map_client/src/model/weather.dart';

/// A function that converts a [responseBody] string into a City class.
///
/// /// Used to work as a separate isolate to prevent freezing in slower devices,
/// call this function with compute function provided by Flutter.
City parseCity(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return City(
    id: parsed['id'] as int,
    country: Country.fromCode(parsed['sys']['country'] as String),
    latitude: double.parse(parsed['coord']['lat'].toString()),
    longitude: double.parse(parsed['coord']['lon'].toString()),
    name: parsed['name'] as String?,
    population: parsed['population'] as int?,
    sunrise: DateTime.fromMillisecondsSinceEpoch(
      parsed['sys']['sunrise'] * 1000 as int,
    ),
    sunset: DateTime.fromMillisecondsSinceEpoch(
      parsed['sys']['sunset'] * 1000 as int,
    ),
  );
}

/// A function that converts a [responseBody] string into a Weather class.
///
/// Used to work as a separate isolate to prevent freezing in slower devices,
/// call this function with compute function provided by Flutter.
Weather parseWeather(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return Weather(
    clouds: parsed['clouds']['all'] as int?,
    condition: parsed['weather'][0]['main'] as String,
    dateTime: DateTime.fromMillisecondsSinceEpoch(parsed['dt'] * 1000 as int),
    description: parsed['weather'][0]['description'] as String,
    groundLevel: parsed['main']['grnd_level'] as int?,
    humidity: parsed['main']['humidity'] as int,
    iconId: parsed['weather'][0]['icon'] as String?,
    maxTemperature: double.parse(parsed['main']['temp_max'].toString()),
    minTemperature: double.parse(parsed['main']['temp_min'].toString()),
    pop: parsed['pop'] != null ? double.parse(parsed['pop'].toString()) : null,
    pressure: parsed['main']['pressure'] as int,
    rainLastHour: parsed['rain']?['1h'] != null
        ? double.parse(parsed['rain']['1h'].toString())
        : null,
    rainLastThreeHours: parsed['rain']?['3h'] != null
        ? double.parse(parsed['rain']['3h'].toString())
        : null,
    seaLevel: parsed['main']['sea_level'] as int?,
    temperature: double.parse(parsed['main']['temp'].toString()),
    temperatureFeelsLike: parsed['main']['feels_like'] != null
        ? double.parse(parsed['main']['feels_like'].toString())
        : null,
    visibility: parsed['visibility'] as int?,
    windDirection: parsed['wind']['deg'] as int?,
    windGust: parsed['wind']?['gust'] != null
        ? double.parse(parsed['wind']['gust'].toString())
        : null,
    windSpeed: double.parse(parsed['wind']['speed'].toString()),
  );
}

/// A function that converts a [responseBody] string into a List<Weather>.
///
/// Used to work as a separate isolate to prevent freezing in slower devices,
/// call this function with compute function provided by Flutter.
List<Weather> parseForecast(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return (parsed['list'] as List<dynamic>)
      .map<Weather>(
        (json) => Weather(
          clouds: json['clouds']['all'] as int?,
          condition: json['weather'][0]['main'] as String,
          dateTime:
              DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000 as int),
          description: json['weather'][0]['description'] as String,
          groundLevel: json['main']['grnd_level'] as int?,
          humidity: json['main']['humidity'] as int,
          iconId: json['weather'][0]['icon'] as String?,
          maxTemperature: double.parse(json['main']['temp_max'].toString()),
          minTemperature: double.parse(json['main']['temp_min'].toString()),
          pop:
              json['pop'] != null ? double.parse(json['pop'].toString()) : null,
          pressure: json['main']['pressure'] as int,
          rainLastHour: json['rain']?['1h'] != null
              ? double.parse(json['rain']['1h'].toString())
              : null,
          rainLastThreeHours: json['rain']?['3h'] != null
              ? double.parse(json['rain']['3h'].toString())
              : null,
          seaLevel: json['main']['sea_level'] as int?,
          temperature: double.parse(json['main']['temp'].toString()),
          temperatureFeelsLike: json['main']['feels_like'] != null
              ? double.parse(json['main']['feels_like'].toString())
              : null,
          visibility: json['visibility'] as int?,
          windDirection: json['wind']['deg'] as int?,
          windGust: json['wind']?['gust'] != null
              ? double.parse(json['wind']['gust'].toString())
              : null,
          windSpeed: double.parse(json['wind']['speed'].toString()),
        ),
      )
      .toList();
}
