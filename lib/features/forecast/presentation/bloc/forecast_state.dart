import '../../domain/entities/forecast.dart';

abstract class ForecastState {}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  ForecastLoaded(this.forecasts);

  final List<Forecast> forecasts;
}

class ForecastError extends ForecastState {}