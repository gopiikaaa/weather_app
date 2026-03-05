import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeatherUseCase {
  GetWeatherUseCase(this.repository);

  final WeatherRepository repository;

  Future<Weather> call({
    required double latitude,
    required double longitude,
  }) async {
    return await repository.getWeather(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
