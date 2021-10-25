import 'package:open_weather_map_client/open_weather_map_client.dart';
import 'current_weather_test.dart';

void main() {
  // OpenWeatherMap instance with api key.
  const OpenWeatherMap weatherMap = OpenWeatherMap(
    apiKey: '21450ca9db82aa862173bf64669fe6a6',
  );
  const CurrentWeatherTest currentWeatherTest = CurrentWeatherTest(
    weatherMap: weatherMap,
  );
  currentWeatherTest.coordinates();
  currentWeatherTest.id();
  currentWeatherTest.name();
}
