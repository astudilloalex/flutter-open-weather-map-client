import 'dart:convert';

import 'package:open_weather_map_client/src/model/api_error.dart';
import 'package:open_weather_map_client/src/model/current_weather.dart';

/*
This file provides methods for parsing text strings json formatted to a class.

Used to work as a separate isolate to prevent freezing in slower devices,
call methods with compute function provided by Flutter.
*/

/// A function that converts a [responseBody] String into a [CurrentWeather] class.
CurrentWeather parseCurrentWeather(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return CurrentWeather.fromJson(parsed as Map<String, dynamic>);
}

/// A function that converts a [responseBody] String into a [ApiError] class.
ApiError parseApiError(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return ApiError.fromJson(parsed as Map<String, dynamic>);
}
