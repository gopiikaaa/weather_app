import '../../domain/entities/city.dart';

class CityModel {

  final String name;
  final double latitude;
  final double longitude;
  final String country;

  CityModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {

    return CityModel(
      name: json['name'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      country: json['country'] ?? '',
    );

  }

  //convert Model → Entity
  City toEntity() {

    return City(
      name: name,
      latitude: latitude,
      longitude: longitude,
      country: country,
    );

  }

}