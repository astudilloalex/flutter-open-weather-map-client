# Open Weather Map Client

Package that communicates with Open Weather Map to obtain climate data in a model.

## Getting Started
[![pub package](https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi)](https://pub.dev/packages/open_weather_map_client)

This package works best with [Provider](https://pub.dev/packages/provider).

### **Get the current weather with Provider**
Use ChangeNotifierProvider to update data from API.
```dart
ChangeNotifierProvider(
    create: (_) => OpenWeatherMapProvider.byCity(
        name: 'London',
        apiKey: '<Use your API key>',
    ),
    builder: (context, _) {
        return FutureBuilder(
            future: context.read<OpenWeatherMapProvider>().load(),
            builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator.adaptative(),
                    );
                }
                return Column(
                    children: [
                        Text('Temperature: ${context.watch<OpenWeatherMapProvider>().weather.temperature} K'),
                        Text('Wind speed: ${context.watch<OpenWeatherMapProvider>().weather.windSpeed} m/s'),
                        ElevatedButton(
                            onPressed: () async {
                                await context.read<OpenWeatherMapProvider>().update();
                            }
                            child: const Text('Update'),
                        ),
                    ],
                );
            }
        );
    }
)
```

### **Get the current weather without Provider**
Here we do not update the data we simply obtain from the API, to update data without Provider, check the example we have to handle StatefulWidget.
```dart
FutureBuilder<Weather>(
    future: OpenWeatherMap(apiKey: '<Use your API key>').currentWeatherByCity(name: 'London'),
    builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator.adaptative(),
            );
        }
        return Column(
            children: [
                Text('Temperature: ${snapshot.data?.temperature} K'),
                Text('Wind speed: ${snapshot.data?.windSpeed} m/s'),
            ],
        );
    },
)
```

![Flutter Open Weather Map Client Example](https://i.postimg.cc/FR2jQJds/Screenshot-2021-08-02-180857.jpg)
