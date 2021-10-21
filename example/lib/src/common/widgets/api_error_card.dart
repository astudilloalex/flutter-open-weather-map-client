import 'package:flutter/material.dart';
import 'package:open_weather_map_client/open_weather_map_client.dart';

class ApiErrorCard extends StatelessWidget {
  const ApiErrorCard({Key? key, required this.apiError}) : super(key: key);

  /// API Error instance.
  final ApiError apiError;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.blueGrey.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${apiError.code.toString()}: ${apiError.message}',
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
