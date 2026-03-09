import '../entities/forecast.dart';
import '../repositories/forecast_repository.dart';

class GetForecastUseCase {

  GetForecastUseCase(this.repository);

  final ForecastRepository repository;

  Future<List<Forecast>> call({
    required double latitude,
    required double longitude,
  }) {

    return repository.get7DayForecast(
      latitude: latitude,
      longitude: longitude,
    );

  }

}