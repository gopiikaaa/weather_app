import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/search_city_usecase.dart';
import 'city_search_event.dart';
import 'city_search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  CitySearchBloc(this.searchCityUseCase) : super(CityInitial()) {
    on<SearchCityEvent>((event, emit) async {
      if (event.cityName.isEmpty) {
        emit(CityInitial());
        return;
      }

      emit(CityLoading());

      try {
        final cities = await searchCityUseCase(event.cityName);

        emit(CityLoaded(cities));
      } catch (e) {
        emit(CityError());
      }
    });
  }

  final SearchCityUseCase searchCityUseCase;
}
