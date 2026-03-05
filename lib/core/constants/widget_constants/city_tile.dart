import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/app_router.dart';
import '../../../features/city_search/domain/entities/city.dart';

class CityTile extends StatelessWidget {
  const CityTile({required this.city, super.key});

  final City city;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: Colors.white.withValues(alpha: 0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: const Icon(Icons.location_city, color: Colors.white),
        title: Text(city.name, style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          city.country,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white70,
          size: 16,
        ),
       onTap: () {
  context.router.push(
    WeatherRoute(
      latitude: city.latitude,
      longitude: city.longitude,
      cityName: city.name,
    ),
  );
}
      ),
    );
  }
}
