abstract class CitySearchEvent {}

class SearchCityEvent extends CitySearchEvent {
  SearchCityEvent(this.cityName);
  final String cityName;
}
