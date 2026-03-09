class Forecast {
  Forecast({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCode,
  });

  final String date;
  final double maxTemp;
  final double minTemp;
  final int weatherCode;
}