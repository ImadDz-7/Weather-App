import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const WeatherApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  ),
                ),
                home: const HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else if (condition == 'Sunny') {
    return Colors.orange;
  } else if (condition == 'Partly cloudy') {
    return Colors.yellow;
  } else if (condition == 'Cloudy' || condition == 'Overcast') {
    return Colors.grey;
  } else if (condition == 'Mist' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.lightBlue;
  } else if (condition.contains('Patchy light') ||
      condition.contains('Patchy rain possible')) {
    return Colors.lightGreen;
  } else if (condition.contains('Light rain') ||
      condition.contains('Moderate rain at times') ||
      condition.contains('Heavy rain')) {
    return Colors.green;
  } else if (condition.contains('Freezing drizzle') ||
      condition.contains('Heavy freezing drizzle')) {
    return Colors.blue;
  } else if (condition.contains('Snow') ||
      condition.contains('Blizzard') ||
      condition.contains('Heavy snow')) {
    return Colors.blueGrey;
  } else if (condition.contains('Sleet')) {
    return Colors.blue;
  } else if (condition.contains('Thundery outbreaks') ||
      condition.contains('thunder')) {
    return Colors.deepPurple;
  } else {
    return Colors.blue; // Default color for unspecified conditions
  }
}
