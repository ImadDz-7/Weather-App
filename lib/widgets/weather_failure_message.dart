import 'package:flutter/material.dart';

class WeatherFailureMessage extends StatelessWidget {
  const WeatherFailureMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/Noweather2.png'),
            width: 300,
          ),
          Text(
            textAlign: TextAlign.center,
            message,
            style: const TextStyle(fontSize: 21),
          ),
        ],
      ),
    );
  }
}
