import '../entities/city.dart';
import '../repositories/city_repository.dart';

class SearchCityUseCase {
  SearchCityUseCase(this.repository);
  final CityRepository repository;

  Future<List<City>> call(String cityName) async {
    return await repository.searchCity(cityName);
  }
}
