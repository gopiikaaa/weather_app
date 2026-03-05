import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/widget_constants/gradient_background.dart';


@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });

  final double latitude;
  final double longitude;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          iconTheme: const IconThemeData(
    color: Colors.white,),
    
          title: Text(
            cityName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "City: $cityName",
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),

              const SizedBox(height: 20),

              Text(
                "Latitude: $latitude",
                style: const TextStyle(color: Colors.white70),
              ),

              Text(
                "Longitude: $longitude",
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}