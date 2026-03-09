import '../../domain/entities/forecast.dart';
import '../../domain/repositories/forecast_repository.dart';
import '../datasources/forecast_remote_datasource.dart';

class ForecastRepositoryImpl implements ForecastRepository {

  ForecastRepositoryImpl(this.remoteDatasource);

  final ForecastRemoteDatasource remoteDatasource;

  @override
  Future<List<Forecast>> get7DayForecast({
    required double latitude,
    required double longitude,
  }) async {

    final models = await remoteDatasource.get7DayForecast(
      latitude: latitude,
      longitude: longitude,
    );

    return models.map((model) => model.toEntity()).toList();
  }
}