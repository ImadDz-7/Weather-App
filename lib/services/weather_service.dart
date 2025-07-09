import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=f8ff0cb220fb438dbb0175745242101&q=$cityName&days=5');
      Map<String, dynamic> jsonData = response.data;

      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);

      return weatherModel;
    } catch (e) {
      return WeatherModel(
        cityName: '',
        date: '',
        temp: 0,
        maxTemp: 0,
        minTemp: 0,
        weatherCondition: '',
      );
    }
  }
}
