import '../../domain/entities/forecast.dart';

class ForecastModel {
  ForecastModel({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCode,
  });

  final String date;
  final double maxTemp;
  final double minTemp;
  final int weatherCode;

  factory ForecastModel.fromJson({
    required String date,
    required double max,
    required double min,
    required int weatherCode,
  }) {
    return ForecastModel(
      date: date,
      maxTemp: max,
      minTemp: min,
      weatherCode: weatherCode,
    );
  }

  Forecast toEntity() {
    return Forecast(
      date: date,
      maxTemp: maxTemp,
      minTemp: minTemp,
      weatherCode: weatherCode,
    );
  }
}