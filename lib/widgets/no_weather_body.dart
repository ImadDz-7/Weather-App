import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage('assets/Noweather.png'),
        ),
        Text(
          textAlign: TextAlign.center,
          'There no weather 😔😞 start searching now 🔍',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
