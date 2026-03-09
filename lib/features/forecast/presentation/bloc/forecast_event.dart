abstract class ForecastEvent {}

class GetForecastEvent extends ForecastEvent {
  GetForecastEvent({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;
}