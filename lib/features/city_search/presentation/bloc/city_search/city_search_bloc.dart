import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/city_repository.dart';
import 'city_search_event.dart';
import 'city_search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  CitySearchBloc(this.repository) : super(CityInitial()) {
    on<SearchCityEvent>((event, emit) async {
      emit(CityLoading());

      try {
        final cities = await repository.searchCity(event.cityName);

        emit(CityLoaded(cities));
      } catch (e) {
        emit(CityError());
      }
    });
  }

  final CityRepository repository;
}
