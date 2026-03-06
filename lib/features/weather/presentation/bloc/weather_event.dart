abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  GetWeatherEvent({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;
}