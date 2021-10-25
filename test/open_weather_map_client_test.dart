import 'package:open_weather_map_client/open_weather_map_client.dart';
import 'current_weather_test.dart';

void main() {
  // OpenWeatherMap instance with api key.
  const OpenWeatherMap weatherMap = OpenWeatherMap(
    apiKey: '6d085bec102ae019e74d51e28370ad59',
  );
  const CurrentWeatherTest currentWeatherTest = CurrentWeatherTest(
    weatherMap: weatherMap,
  );
  currentWeatherTest.coordinates();
  currentWeatherTest.id();
  currentWeatherTest.name();
}
