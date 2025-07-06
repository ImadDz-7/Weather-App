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
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Updated at : 15:02',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 36),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 12),
            const Image(
              image: AssetImage('assets/cloudy.png'),
            ),
            const Text(
              '28',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('maxTemp: 30'),
                Text('minTemp: 17'),
              ],
            ),
            const SizedBox(width: 12),
          ],
        ),
        const SizedBox(height: 36),
        const Text(
          'Sunny',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
