import 'package:example/src/current_weather/current_weather_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    const List<Widget> children = [
      _CardTile(routeName: CurrentWeatherView.routeName),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
      ),
    );
  }
}

class _CardTile extends StatelessWidget {
  const _CardTile({Key? key, required this.routeName}) : super(key: key);

  /// Route name navigation.
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_title),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
      ),
    );
  }

  /// Returns the title depending of the route name.
  String get _title {
    switch (routeName) {
      case CurrentWeatherView.routeName:
        return 'Current Weather';
      default:
        return 'Current Weather';
    }
  }
}
