import '../../domain/entities/city.dart';
import '../../domain/repositories/city_repository.dart';
import '../datasources/city_remote_datasource.dart';

class CityRepositoryImpl implements CityRepository {
  CityRepositoryImpl(this.remoteDatasource);

  final CityRemoteDatasource remoteDatasource;

  @override
  Future<List<City>> searchCity(String cityName) async {
    final models = await remoteDatasource.searchCity(cityName);

    final cities = models.map((model) {
      return model.toEntity();
    }).toList();

    return cities;
  }
}
