import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/city_model.dart';

class CityRemoteDatasource {
  CityRemoteDatasource(this.dioClient);

  final DioClient dioClient;

  Future<List<CityModel>> searchCity(String cityName) async {
    try {
      final response = await dioClient.get(
        ApiConstants.searchCity,
        queryParameters: {"name": cityName},
      );

      final List results = response.data["results"] ?? [];

      final List<CityModel> cities = results.map((cityJson) {
        return CityModel.fromJson(cityJson);
      }).toList();

      return cities;
    } catch (e) {
      print("ERROR: $e");

      throw Exception("City fetch failed");
    }
  }
}
