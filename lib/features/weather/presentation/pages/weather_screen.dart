import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/router/app_router.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(   

      appBar: AppBar(
        title: const Text("Weather Screen"),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.push(const ForecastRoute());
          },
          child: const Text("Go to Forecast"),
        ),
      ),

    );
  }
}