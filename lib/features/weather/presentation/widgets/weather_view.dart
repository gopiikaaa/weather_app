import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/widget_constants/gradient_background.dart';
import '../../../../core/utils/weather_utils.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_state.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({required this.cityName, super.key});

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          title: Text(
            cityName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {

            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is WeatherLoaded) {

              final weather = state.weather;

              final weatherText =
                  WeatherUtils.getWeatherCondition(weather.weatherCode);

              final icon = weatherText.split(" ")[0];
              final condition = weatherText.split(" ").sublist(1).join(" ");

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    
                    Text(
                      icon,
                      style: const TextStyle(fontSize: 90),
                    ),

                    const SizedBox(height: 10),

                    
                    Text(
                      "${weather.temperature}°C",
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    
                    Text(
                      condition,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 30),

                    
                    const Divider(
                      color: Colors.white30,
                      thickness: 1,
                      indent: 80,
                      endIndent: 80,
                    ),

                    const SizedBox(height: 25),

                    
                    Column(
                      children: [

                        const Icon(
                          Icons.air,
                          color: Colors.white,
                          size: 30,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "${weather.windSpeed} km/h",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        const Text(
                          "Wind",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }

            if (state is WeatherError) {
              return const Center(
                child: Text(
                  StringConstants.kWeatherFailed,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}