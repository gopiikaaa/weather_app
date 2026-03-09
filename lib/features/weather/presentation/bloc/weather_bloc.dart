import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_weather_usecase.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherBloc(this.getWeatherUseCase) : super(WeatherInitial()) {

    on<GetWeatherEvent>((event, emit) async {

      emit(WeatherLoading());

      try {

        final weather = await getWeatherUseCase(
          latitude: event.latitude,
          longitude: event.longitude,
        );

        emit(WeatherLoaded(weather));

      } catch (e) {

        emit(WeatherError());

      }

    });

  }

  final GetWeatherUseCase getWeatherUseCase;

}