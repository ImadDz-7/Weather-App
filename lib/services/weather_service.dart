import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'f8ff0cb220fb438dbb0175745242101';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5');
      Map<String, dynamic> jsonData = response.data;

      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Oops there was an error, try later!';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there was an error, try later!');
    }
  }
}
