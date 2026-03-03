import '../entities/city.dart';

abstract class CityRepository {

Future<List<City>> searchCity(String cityName);
}