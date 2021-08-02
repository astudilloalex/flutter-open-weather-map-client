import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:open_weather_map_client/src/common/constants.dart';
import 'package:open_weather_map_client/src/common/parse_data.dart';
import 'package:open_weather_map_client/src/model/city.dart';
import 'package:open_weather_map_client/src/model/weather.dart';
import 'package:http/http.dart' as http;

/// Useful to obtain weather data, it connects with the Open Weather Map API.
class OpenWeatherMap {
  /// The key obtained from the Open Weather Map API.
  final String apiKey;

  /// The language to get the data from the API.
  final Language language;

  /// Controls the maximum time in seconds to wait to get the data.
  /// If you have a slow connection make sure to use the correct seconds.
  ///
  /// Default is 5 seconds
  final int requestTimeout;

  /// Current weather city.
  Future<City>? _city;

  /// Creates a OpenWeatherMap instance.
  ///
  /// The [apiKey] is required to connect with API, The [language] parameter its
  /// default value is English and [requestTimeout] parameter its default value is 5.
  OpenWeatherMap({
    required this.apiKey,
    this.language = Language.english,
    this.requestTimeout = 5,
  });

  /// Parameters to use in URI for get request to API
  Map<String, String> _parameters({
    int? cityId,
    String? cityName,
    String? countryCode,
    double? latitude,
    double? longitude,
  }) {
    String? city = cityName;
    if (city != null && countryCode != null) {
      city += ',$countryCode';
    }
    return {
      'appid': apiKey,
      if (cityId != null) 'id': cityId.toString(),
      if (city != null && cityId == null) 'q': city,
      if (city == null && cityId == null) 'lat': latitude.toString(),
      if (city == null && cityId == null) 'lon': longitude.toString(),
      'lang': languageCode(language),
    };
  }

  /// Response request body from network as String
  Future<String> _response(Uri uri) async {
    return http
        .get(uri)
        .timeout(Duration(seconds: requestTimeout),
            onTimeout: () => throw TimeoutException(
                'The connection has timed out, Please try again!'))
        .then(
          (value) => value.body,
        );
  }

  /// Returns the current weather by city information.
  ///
  /// The optional [id] parameter is the city ID used by API to get current
  /// weather; the oprional [countryCode] parameter work with required city
  /// [name] for more precision.
  Future<Weather> currentWeatherByCity({
    int? id,
    String? countryCode,
    required String name,
  }) async {
    final String responseBody = await _response(
      Uri.https(
        apiAuthority,
        '$apiUnencodedPath$apiCurrentWeatherPath',
        _parameters(cityId: id, countryCode: countryCode, cityName: name),
      ),
    );
    _city ??= compute(parseCity, responseBody);
    return compute(parseWeather, responseBody);
  }

  /// Return the current weather by [latitude] and [longitude] required parameters.
  Future<Weather> currentWeatherByLocation({
    required double latitude,
    required double longitude,
  }) async {
    final String responseBody = await _response(
      Uri.https(
        apiAuthority,
        '$apiUnencodedPath$apiCurrentWeatherPath',
        _parameters(latitude: latitude, longitude: longitude),
      ),
    );
    _city ??= compute(parseCity, responseBody);
    return compute(parseWeather, responseBody);
  }

  /// Returns the five day forecast as a List<Weather>.
  ///
  /// The optional [id] parameter is the city ID used by API to get current
  /// weather; the oprional [countryCode] parameter work with required city
  /// [name] for more precision.
  Future<List<Weather>> forecastByCity({
    int? id,
    String? countryCode,
    required String name,
  }) async {
    final Uri uri = Uri.https(
      apiAuthority,
      '$apiUnencodedPath$apiFiveDayForecastPath',
      _parameters(cityId: id, countryCode: countryCode, cityName: name),
    );
    return compute(parseForecast, await _response(uri));
  }

  /// Returns the five day forecast by [latitude] and [longitude] required parameters.
  Future<List<Weather>> forecastByLocation({
    required double latitude,
    required double longitude,
  }) async {
    final Uri uri = Uri.https(
      apiAuthority,
      '$apiUnencodedPath$apiFiveDayForecastPath',
      _parameters(latitude: latitude, longitude: longitude),
    );
    return compute(parseForecast, await _response(uri));
  }

  /// Returns the current detailed city.
  ///
  /// If you do not call the [currentWeatherByCity] or [currentWeatherByLocation]
  /// method returns null, the city is loaded when obtaining the current weather.
  Future<City>? get detailedCity => _city;
}
