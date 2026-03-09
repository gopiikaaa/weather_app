import '../../../domain/entities/city.dart';

abstract class CitySearchState {}

class CityInitial extends CitySearchState {}

class CityLoading extends CitySearchState {}

class CityLoaded extends CitySearchState {
  CityLoaded(this.cities);
  final List<City> cities;
}

class CityError extends CitySearchState {}
