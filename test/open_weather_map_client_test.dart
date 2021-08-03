import 'package:flutter_test/flutter_test.dart';

import 'package:open_weather_map_client/open_weather_map_client.dart';

void main() {
  final OpenWeatherMap _api = OpenWeatherMap(
    apiKey: '856822fd8e22db5e1ba48c0e7d69844a',
  );
  test('Check values from Weather class', () async {
    //final Weather weather = _api.currentWeather;
    //expect(weather.humidity, isA<int>());
  });
}
