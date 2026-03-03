import 'package:weather_app/features/city_search/domain/entities/city.dart';


abstract class CitySearchState {}

class CityInitial extends CitySearchState {}

class CityLoading extends CitySearchState {}

class CityLoaded extends CitySearchState {
  final List<City> cities;

  CityLoaded(this.cities);
}

class CityError extends CitySearchState {}