import '../../domain/entities/weather.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  WeatherLoaded(this.weather);

  final Weather weather;
}

class WeatherError extends WeatherState {}