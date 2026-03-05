import '../../domain/entities/weather.dart';

class WeatherModel {

  WeatherModel({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: (json['temperature'] ?? 0).toDouble(),
      windSpeed: (json['windspeed'] ?? 0).toDouble(),
      weatherCode: json['weathercode'] ?? 0,
    );
  }

  final double temperature;
  final double windSpeed;
  final int weatherCode;

  Weather toEntity() {
    return Weather(
      temperature: temperature,
      windSpeed: windSpeed,
      weatherCode: weatherCode,
    );
  }
}
