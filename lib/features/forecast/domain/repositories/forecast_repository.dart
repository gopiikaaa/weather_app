import '../entities/forecast.dart';

abstract class ForecastRepository {

  Future<List<Forecast>> get7DayForecast({
    required double latitude,
    required double longitude,
  });

}