import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Algeria',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Updated at : 15:02',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Row(
          children: const [
            Image(
              image: AssetImage(''),
            ),
            Text(
              '28',
              style: TextStyle(fontSize: 22),
            ),
            
          ],
        ),
      ],
    );
  }
}
