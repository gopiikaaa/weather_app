import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {

  WeatherRepositoryImpl(this.remoteDatasource);

  final WeatherRemoteDatasource remoteDatasource;

  @override
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {

    final weatherModel = await remoteDatasource.getWeather(
      latitude: latitude,
      longitude: longitude,
    );

    return weatherModel.toEntity();
  }
}