# Open Weather Map Client

Package that communicates with Open Weather Map to obtain climate data in a model.

## Getting Started
[![pub package](https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi)](https://pub.dev/packages/open_weather_map_client)

### **Get the current weather**
See the full example at: https://github.com/astudilloalex/flutter-open-weather-map-client/tree/main/example
```dart
FutureBuilder<CurrentWeather>(
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
                    Text('City: ${weather.city.name}'),
                    Text('Temperature: ${weather.detail.temperatureCelsius.toStringAsFixed(2)} °C'),
                    Text('Speed: ${weather.wind.speed.toStringAsFixed(2)} m/s'),
                ],
            ),
        );
    },
),
```

![Flutter Open Weather Map Client Example](https://i.postimg.cc/xjZDdtdK/Screenshot-1634779262.png)
