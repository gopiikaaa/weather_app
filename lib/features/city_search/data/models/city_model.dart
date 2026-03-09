import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/city.dart';

class CityModel {
  CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json[ApiConstants.name] ?? '',
      latitude: (json[ApiConstants.latitude] ?? 0).toDouble(),
      longitude: (json[ApiConstants.longitude] ?? 0).toDouble(),
      country: json[ApiConstants.country] ?? '',
    );
  }

  final String name;
  final double latitude;
  final double longitude;
  final String country;

  City toEntity() {
    return City(
      name: name,
      latitude: latitude,
      longitude: longitude,
      country: country,
    );
  }
}