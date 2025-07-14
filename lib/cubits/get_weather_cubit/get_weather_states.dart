import 'package:weather/models/weather_model.dart';

class WeatherState {}

class NoWeatherInitialState extends WeatherState {
  
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState({required this.weatherModel});
  final WeatherModel weatherModel;
}

class WeatherFailureState extends WeatherState {}
