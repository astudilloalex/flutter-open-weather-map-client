import 'package:example/src/common/constants.dart';
import 'package:example/src/common/widgets/api_error_card.dart';
import 'package:flutter/material.dart';
import 'package:open_weather_map_client/open_weather_map_client.dart';

class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView({Key? key}) : super(key: key);

  static const routeName = '/current-weather';

  @override
  Widget build(BuildContext context) {
    const OpenWeatherMap openWeatherMap = OpenWeatherMap(
      apiKey: openWeatherApiKey,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
      ),
      body: FutureBuilder<CurrentWeather>(
        future: openWeatherMap.currentWeather(const City(name: 'London')),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return ApiErrorCard(apiError: snapshot.error! as ApiError);
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Error obtained data, check internet connection',
              ),
            );
          }
          final CurrentWeather weather = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Date: ${weather.dateTime}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Country: ${weather.city.country?.code}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  'City: ${weather.city.name}',
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Temperature: ${weather.detail.temperatureCelsius.toStringAsFixed(2)} °C',
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Pressure: ${weather.detail.pressureAtmosphere?.toStringAsFixed(2)} atm',
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  'Speed: ${weather.wind.speed.toStringAsFixed(2)} m/s',
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
