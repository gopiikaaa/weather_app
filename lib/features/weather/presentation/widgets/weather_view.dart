import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/widget_constants/gradient_background.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/weather_utils.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({
    required this.cityName,
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final String cityName;
  final double latitude;
  final double longitude;

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

        body: RefreshIndicator(
          onRefresh: () async {
            
            context.read<WeatherBloc>().add(
                  GetWeatherEvent(
                    latitude: latitude,
                    longitude: longitude,
                  ),
                );
          },

          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is WeatherLoaded) {
                final weather = state.weather;

                final weatherText =
                    WeatherUtils.getWeatherCondition(weather.weatherCode);

                final icon = weatherText.split(" ")[0];
                final condition =
                    weatherText.split(" ").sublist(1).join(" ");

                return ListView(
                  children: [
                    const SizedBox(height: 120),

                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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

                           
                            Container(
                              height: 1,
                              width: 150,
                              color: Colors.white30,
                            ),

                            const SizedBox(height: 20),

                            
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

                            const SizedBox(height: 30),

                            /// Forecast Button
                            ElevatedButton(
                              onPressed: () {
                                context.router.push(
                                  ForecastRoute(
                                    latitude: latitude,
                                    longitude: longitude,
                                    cityName: cityName,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text("7 Day Forecast"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
      ),
    );
  }
}