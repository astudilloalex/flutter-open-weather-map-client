import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather_map_client/open_weather_map_client.dart';
import 'package:open_weather_map_client/src/common/constants.dart';
import 'package:open_weather_map_client/src/common/parse_data.dart';
import 'package:open_weather_map_client/src/model/city.dart';
import 'package:open_weather_map_client/src/model/coordinates.dart';
import 'package:open_weather_map_client/src/model/current_weather.dart';

/// Useful to obtain weather data, it connects with the Open Weather Map API.
class OpenWeatherMap {
  /// Define a [OpenWeatherMap] class.
  const OpenWeatherMap({
    required this.apiKey,
    this.langCode,
    this.language = Language.english,
    this.requestTimeout = 5,
  });

  /// The key obtained from the Open Weather Map API.
  final String apiKey;

  /// The language code to get description from API.
  ///
  /// Check the https://openweathermap.org/current#multi for supported codes.
  final String? langCode;

  /// The language to get the data from the API, default english.
  final Language language;

  /// Controls the maximum time in seconds to wait to get the data.
  /// If you have a slow connection make sure to use the correct seconds.
  ///
  /// Default is 5 seconds
  final int requestTimeout;

  /// Parameters to use in URI for get request to API
  Map<String, dynamic> _parameters(City city) {
    final Coordinates? coordinates = city.coordinates;
    final StringBuffer name = StringBuffer();
    if (city.name != null) {
      name.write(city.name);
      if (name.isNotEmpty && city.country != null) {
        name.write(',${city.country!.code}');
      }
    }
    return {
      'appid': apiKey,
      if (coordinates == null && city.id != null) 'id': city.id.toString(),
      if (coordinates == null && city.id == null) 'q': name.toString(),
      if (coordinates != null) 'lat': coordinates.latitude.toString(),
      if (coordinates != null) 'lon': coordinates.longitude.toString(),
      'lang': langCode?.toLowerCase() ?? languageCode(language),
    };
  }

  /// Returns a Future of [CurrentWeather] class by [city] information.
  ///
  /// Returns a Future error with [ApiError] class when status code of response
  /// is different that 200.
  Future<CurrentWeather> currentWeather(City city) async {
    final http.Response response = await http
        .get(
          Uri.https(
            kFreeApiAuthority,
            '$kApiUnencodedPath$kApiCurrentWeatherPath',
            _parameters(city),
          ),
        )
        .timeout(
          Duration(seconds: requestTimeout),
          onTimeout: () => http.Response(
            '{"cod": 408, "message": "Connection timeout"}',
            408,
          ),
        );
    if (response.statusCode == 200) {
      return compute(parseCurrentWeather, response.body);
    }
    return Future.error(await compute(parseApiError, response.body));
  }
}
