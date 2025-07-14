import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weatherModel.cityName,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Updated at : 15:02',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 46),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            Image(
              image: NetworkImage('https:${weatherModel.image!}'),
            ),
             Text(
              weatherModel.temp.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('maxTemp: ${weatherModel.maxTemp.round()}'),
                Text('minTemp: ${weatherModel.minTemp.round()}'),
              ],
            ),
            const SizedBox(width: 10),
          ],
        ),
        const SizedBox(height: 46),
        Text(
          weatherModel.weatherCondition,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
