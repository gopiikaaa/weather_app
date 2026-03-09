import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/weather_model.dart';

class WeatherRemoteDatasource {
  WeatherRemoteDatasource(this.dioClient);

  final DioClient dioClient;

  Future<WeatherModel> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await dioClient.get(
        ApiConstants.weather,
        queryParameters: {
          ApiConstants.latitude: latitude,
          ApiConstants.longitude: longitude,
          ApiConstants.currentWeather: true,
        },
      );

      final weatherJson = response.data["current_weather"];

      return WeatherModel.fromJson(weatherJson);
    } catch (e) {
      throw Exception("Weather fetch failed");
    }
  }
}
