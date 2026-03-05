import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  });
}
