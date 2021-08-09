import 'package:flutter/material.dart';
import 'package:open_weather_map_client/open_weather_map_client.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          backgroundColor: Colors.teal,
        ),
        body: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            WithoutProvider(),
            WithProvider(),
          ],
        ),
      ),
    );
  }
}

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Working with provider',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ChangeNotifierProvider(
            create: (context) => OpenWeatherMapProvider.byCity(
              name: 'London',
              apiKey: '<Use your API key>',
            ),
            builder: (context, _) {
              return FutureBuilder(
                future: context.read<OpenWeatherMapProvider>().load(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return Column(
                    children: [
                      Text(
                        'Country: ${context.watch<OpenWeatherMapProvider>().city.country?.name}',
                      ),
                      const Divider(),
                      Text(
                        'City: ${context.watch<OpenWeatherMapProvider>().city.name}',
                      ),
                      const Divider(),
                      Text(
                        'Temperature: ${context.watch<OpenWeatherMapProvider>().weather.temperatureInCelsius.toStringAsFixed(2)} °C',
                      ),
                      const Divider(),
                      Text(
                        'Wind speed: ${context.watch<OpenWeatherMapProvider>().weather.windSpeedInKilometersPerHour.toStringAsFixed(2)} Km/h',
                      ),
                      const Divider(),
                      const Text('Forecast'),
                      SizedBox(
                        height: 100,
                        width: 300.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: context
                                  .watch<OpenWeatherMapProvider>()
                                  .forecast
                                  ?.length ??
                              0,
                          itemBuilder: (_, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'Datetime: ${context.watch<OpenWeatherMapProvider>().forecast?[index].dateTime}'),
                                    const Divider(),
                                    Text(
                                      'Temperature: ${context.watch<OpenWeatherMapProvider>().forecast?[index].temperatureInCelsius.toStringAsFixed(2)}',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            await context
                                .read<OpenWeatherMapProvider>()
                                .update();
                          },
                          child: const Text('Update'),
                        ),
                      ),
                      const Divider(
                        thickness: 0,
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

/// Using API without provider package.
class WithoutProvider extends StatelessWidget {
  const WithoutProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Working without provider',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            WeatherWithoutProvider(),
          ],
        ),
      ),
    );
  }
}

class WeatherWithoutProvider extends StatefulWidget {
  const WeatherWithoutProvider({Key? key}) : super(key: key);

  @override
  _WeatherWithoutProviderState createState() => _WeatherWithoutProviderState();
}

class _WeatherWithoutProviderState extends State<WeatherWithoutProvider> {
  final OpenWeatherMap _openWeatherMap = OpenWeatherMap(
    apiKey: '<Use your API key>',
  );

  City? _city;
  Weather? _weather;
  List<Weather>? _forecast;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_weather == null) {
      return const Center(
        child: Text('Data could not be obtained.'),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country: ${_city?.country?.name}',
        ),
        const Divider(),
        Text(
          'City: ${_city?.name}',
        ),
        const Divider(),
        Text(
          'Temperature: ${_weather!.temperatureInCelsius.toStringAsFixed(2)} °C',
        ),
        const Divider(),
        Text(
          'Wind speed: ${_weather!.windSpeedInKilometersPerHour.toStringAsFixed(2)} Km/h',
        ),
        const Divider(),
        const Text('Forecast'),
        SizedBox(
          height: 100,
          width: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _forecast?.length ?? 0,
            itemBuilder: (_, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Datetime: ${_forecast?[index].dateTime}'),
                      const Divider(),
                      Text(
                        'Temperature: ${_forecast?[index].temperatureInCelsius.toStringAsFixed(2)}',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Divider(),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              await _load();
            },
            child: const Text('Update'),
          ),
        ),
        const Divider(
          thickness: 0,
        ),
      ],
    );
  }

  // Load initial data for current weather.
  // Always call the currentWeather function first and then detailedCity or
  // city will return null.
  Future<void> _load() async {
    _weather = await _openWeatherMap.currentWeatherByCity(name: 'London');
    _forecast = await _openWeatherMap.forecastByCity(name: 'London');
    _city = await _openWeatherMap.detailedCity;
    setState(() {});
  }
}
