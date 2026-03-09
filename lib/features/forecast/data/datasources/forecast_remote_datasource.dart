import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/forecast_model.dart';

class ForecastRemoteDatasource {
  ForecastRemoteDatasource(this.dioClient);

  final DioClient dioClient;

  Future<List<ForecastModel>> get7DayForecast({
    required double latitude,
    required double longitude,
  }) async {
    final response = await dioClient.get(
      ApiConstants.weather,
      queryParameters: {
        ApiConstants.latitude: latitude,
        ApiConstants.longitude: longitude,
        "daily": "weathercode,temperature_2m_max,temperature_2m_min",
        "timezone": "auto",
      },
    );

    final daily = response.data["daily"];

    final List dates = daily["time"] ?? [];
    final List maxTemps = daily["temperature_2m_max"] ?? [];
    final List minTemps = daily["temperature_2m_min"] ?? [];
    final List weatherCodes = daily["weathercode"] ?? [];

    List<ForecastModel> forecasts = [];

    for (int i = 0; i < dates.length; i++) {
      forecasts.add(
        ForecastModel.fromJson(
          date: dates[i],
          max: (maxTemps[i]).toDouble(),
          min: (minTemps[i]).toDouble(),
          weatherCode: weatherCodes[i] ?? 0,
        ),
      );
    }

    return forecasts;
  }
}
