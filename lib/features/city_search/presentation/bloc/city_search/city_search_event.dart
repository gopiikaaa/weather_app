abstract class CitySearchEvent {}

class SearchCityEvent extends CitySearchEvent {
  final String cityName;

  SearchCityEvent(this.cityName);
}