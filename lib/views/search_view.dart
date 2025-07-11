import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

WeatherModel? weatherModel;

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              weatherModel = await WeatherService(Dio())
                  .getCurrentWeather(cityName: value);
              log(weatherModel!.cityName);
              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: 'Search',
              suffixIcon: const Icon(Icons.search),
              hintText: 'Enter city name',
            ),
          ),
        ),
      ),
    );
  }
}
