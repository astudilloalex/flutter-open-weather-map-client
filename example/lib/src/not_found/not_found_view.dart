import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '404: Page not found',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
