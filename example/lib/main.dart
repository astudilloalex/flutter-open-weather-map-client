import 'package:example/src/current_weather/current_weather_view.dart';
import 'package:example/src/home/home_view.dart';
import 'package:example/src/not_found/not_found_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter open_weather_map_client example',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            switch (settings.name) {
              case CurrentWeatherView.routeName:
                return const CurrentWeatherView();
              case HomeView.routeName:
                return const HomeView();
              default:
                return const NotFoundView();
            }
          },
          settings: settings,
        );
      },
    );
  }
}
