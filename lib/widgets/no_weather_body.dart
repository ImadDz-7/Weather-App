import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Image(
          image: AssetImage('assets/Noweather.png'),
        ),
      ],
    );
  }
}
