import 'package:flutter_test/flutter_test.dart';
import 'package:open_weather_map_client/open_weather_map_client.dart';
import 'package:open_weather_map_client/src/model/city.dart';
import 'package:open_weather_map_client/src/model/coordinates.dart';
import 'package:open_weather_map_client/src/model/current_weather.dart';

class CurrentWeatherTest {
  final OpenWeatherMap weatherMap;

  const CurrentWeatherTest({required this.weatherMap});

  /// Test by coordinates.
  void coordinates() {
    test('Check the current weather of London by coordinates', () async {
      final CurrentWeather weather = await weatherMap.currentWeather(
        const City(
          coordinates: Coordinates(51.5085, -0.1257),
          id: 2643743,
          name: 'London',
        ),
      );
      expect(weather.city.name, 'London');
      expect(weather.city.country, isA<Country>());
      expect(weather.city.country, isNotNull);
      expect(weather.city.country!.code, 'GB');
      expect(
        1000 < weather.detail.pressure! && weather.detail.pressure! < 1030,
        isTrue,
      );
      expect(weather.city.timezone, 3600);
    });
    test('Check the current weather of Miraflores by coordinates', () async {
      final CurrentWeather weather = await weatherMap.currentWeather(
        const City(coordinates: Coordinates(-2.8833, -78.9833)),
      );
      expect(weather.city.name, 'Miraflores');
      expect(weather.city.country, isA<Country>());
      expect(weather.city.country, isNotNull);
      expect(weather.city.coordinates?.latitude, -2.8833);
      expect(weather.city.coordinates?.longitude, -78.9833);
      expect(weather.city.country!.code, 'EC');
      expect(
        1000 < weather.detail.pressure! && weather.detail.pressure! < 1030,
        isTrue,
      );
      expect(weather.city.timezone, -18000);
    });
  }

  void id() {
    test('Check the current weather of London by city id', () async {
      final CurrentWeather weather = await weatherMap.currentWeather(
        const City(id: 2643743, name: 'London'),
      );
      expect(weather.city.name, 'London');
      expect(weather.city.country, isA<Country>());
      expect(weather.city.country, isNotNull);
      expect(weather.city.country!.code, 'GB');
      expect(
        1000 < weather.detail.pressure! && weather.detail.pressure! < 1030,
        isTrue,
      );
      expect(weather.city.timezone, 3600);
    });

    test('Check the current weather of Cuenca by city id', () async {
      final CurrentWeather weather = await weatherMap.currentWeather(
        const City(id: 3658666, name: 'Cuenca'),
      );
      expect(weather.city.name, 'Cuenca');
      expect(weather.city.country, isA<Country>());
      expect(weather.city.country, isNotNull);
      expect(weather.city.country!.code, 'EC');
      expect(
        1000 < weather.detail.pressure! && weather.detail.pressure! < 1030,
        isTrue,
      );
      expect(weather.city.timezone, -18000);
    });
  }

  /// Test by city name.
  void name() {
    test('Check the current weather of London by name', () async {
      final CurrentWeather weather =
          await weatherMap.currentWeather(const City(name: 'London'));
      expect(weather.city.name, 'London');
      expect(weather.city.country, isA<Country>());
      expect(weather.city.country, isNotNull);
      expect(weather.city.country!.code, 'GB');
      expect(
        1000 < weather.detail.pressure! && weather.detail.pressure! < 1030,
        isTrue,
      );
      expect(weather.city.timezone, 3600);
    });

    test('Check the current weather of Cuenca by name', () async {
      final CurrentWeather weather =
          await weatherMap.currentWeather(const City(name: 'Cuenca'));
      expect(weather.city.name, 'Cuenca');
      expect(weather.city.country, isA<Country>());
      expect(weather.city.country, isNotNull);
      expect(weather.city.country!.code, 'EC');
      expect(
        1000 < weather.detail.pressure! && weather.detail.pressure! < 1030,
        isTrue,
      );
      expect(weather.city.timezone, -18000);
    });
  }
}
