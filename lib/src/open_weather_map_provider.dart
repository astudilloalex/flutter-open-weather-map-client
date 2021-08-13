import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_map_client/src/common/constants.dart';
import 'package:open_weather_map_client/src/common/parse_data.dart';
import 'package:open_weather_map_client/src/model/city.dart';
import 'package:open_weather_map_client/src/model/country.dart';
import 'package:open_weather_map_client/src/model/weather.dart';
import 'package:http/http.dart' as http;

/// Useful to obtain weather data, it connects with the Open Weather Map API.
class OpenWeatherMapProvider with ChangeNotifier {
  /// The key obtained from the Open Weather Map API.
  final String apiKey;

  /// The language code to get description from API.
  final String? langCode;

  /// Use the supported [Language] to get the data from the API.
  final Language language;

  /// If you don't need the five-day forecast, define it as false.
  ///
  /// Default is true.
  final bool loadForecast;

  /// If true the parameters to get data from API are set with longitude and latitude.
  final bool _loadByCoordinates;

  // Controls the maximum time in seconds to wait to get the data.
  /// If you have a slow connection make sure to use the correct seconds.
  ///
  /// Default is 5 seconds
  final int requestTimeout;

  /// Detailed city.
  City _city;

  /// Current weather.
  late Weather _weather;

  /// Five day forecast.
  List<Weather>? _forecast;

  /// Create a OpenWeatherMapProvider class to search weather by city.
  ///
  /// The [name] parameter is required.
  OpenWeatherMapProvider.byCity({
    int? id,
    required String name,
    String? countryCode,
    required this.apiKey,
    this.langCode,
    this.language = Language.english,
    this.loadForecast = true,
    this.requestTimeout = 5,
  })  : _city = City(
          id: id,
          name: name,
          country: countryCode != null ? Country.fromCode(countryCode) : null,
        ),
        _loadByCoordinates = false;

  /// Create a OpenWeatherMapProvider class to search weather by geographic coordinates.
  ///
  /// The [latitude] and [longitude] parameters are required.
  OpenWeatherMapProvider.byLocation({
    required double latitude,
    required double longitude,
    required this.apiKey,
    this.langCode,
    this.language = Language.english,
    this.loadForecast = true,
    this.requestTimeout = 5,
  })  : _city = City(
          latitude: latitude,
          longitude: longitude,
        ),
        _loadByCoordinates = true;

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

  /// Get current weather of the city.
  Future<Weather> get _currentWeather async {
    final String body = await _response(
      Uri.https(
        apiAuthority,
        '$apiUnencodedPath$apiCurrentWeatherPath',
        _parameters,
      ),
    );
    if (_city.sunrise == null) _city = await compute(parseCity, body);
    return compute(parseWeather, body);
  }

  /// Get the five day forecast
  Future<List<Weather>> get _fiveDayForecast async {
    return compute(
      parseForecast,
      await _response(
        Uri.https(
          apiAuthority,
          '$apiUnencodedPath$apiFiveDayForecastPath',
          _parameters,
        ),
      ),
    );
  }

  /// Parameters to use in URI for get request to API
  Map<String, String> get _parameters {
    String? city = _city.name;
    if (city != null && _city.country?.code != null) {
      city += ',${_city.country!.code}';
    }
    return {
      'appid': apiKey,
      if (_city.id != null && !_loadByCoordinates) 'id': _city.id.toString(),
      if (city != null && _city.id == null && !_loadByCoordinates) 'q': city,
      if (_loadByCoordinates) 'lat': _city.latitude.toString(),
      if (_loadByCoordinates) 'lon': _city.longitude.toString(),
      'lang': langCode ?? languageCode(language),
    };
  }

  /// Load current [weather] and five day [forecast] if [loadForecast] is true
  Future<void> load() async {
    _weather = await _currentWeather;
    if (loadForecast) _forecast = await _fiveDayForecast;
  }

  /// Update data and notify listeners
  Future<void> update() async {
    _weather = await _currentWeather;
    if (loadForecast) _forecast = await _fiveDayForecast;
    notifyListeners();
  }

  /// Returns the detailed city.
  City get city => _city;

  /// Returns the current weather
  Weather get weather => _weather;

  /// Returns the five day forecast if [loadForecast] is true, otherwise it returns null.
  List<Weather>? get forecast => _forecast;
}
