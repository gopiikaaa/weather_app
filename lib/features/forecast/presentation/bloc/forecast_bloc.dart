import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_forecast_usecase.dart';
import 'forecast_event.dart';
import 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {

  ForecastBloc(this.getForecastUseCase) : super(ForecastInitial()) {

    on<GetForecastEvent>((event, emit) async {

      emit(ForecastLoading());

      try {

        final forecasts = await getForecastUseCase(
          latitude: event.latitude,
          longitude: event.longitude,
        );

        emit(ForecastLoaded(forecasts));

      } catch (e) {

        emit(ForecastError());

      }

    });

  }

  final GetForecastUseCase getForecastUseCase;
}