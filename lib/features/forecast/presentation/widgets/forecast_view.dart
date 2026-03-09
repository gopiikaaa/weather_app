import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/widget_constants/gradient_background.dart';
import '../../../../core/utils/weather_utils.dart';
import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_event.dart';
import '../bloc/forecast_state.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({
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
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        body: BlocBuilder<ForecastBloc, ForecastState>(
          builder: (context, state) {

            if (state is ForecastLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ForecastLoaded) {

              final forecasts = state.forecasts;

              return Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "7 Days Weather",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {

                          
                          context.read<ForecastBloc>().add(
                            GetForecastEvent(
                              latitude: latitude,
                              longitude: longitude,
                            ),
                          );

                        },

                        child: ListView.builder(
                          itemCount: forecasts.length,

                          itemBuilder: (context, index) {

                            final forecast = forecasts[index];

                            final date = DateTime.parse(forecast.date);
                            final day = [
                              "Sun","Mon","Tue","Wed","Thu","Fri","Sat"
                            ][date.weekday % 7];

                            final weatherText = WeatherUtils
                                .getWeatherCondition(forecast.weatherCode);

                            final icon = weatherText.split(" ")[0];
                            final condition =
                                weatherText.split(" ").sublist(1).join(" ");

                            return Container(
                              margin: const EdgeInsets.only(bottom: 14),

                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white24,
                                ),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(
                                    day,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),

                                  Text(
                                    icon,
                                    style: const TextStyle(fontSize: 26),
                                  ),

                                  Text(
                                    condition,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),

                                  Row(
                                    children: [

                                      Text(
                                        "+${forecast.maxTemp.toInt()}°",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      Text(
                                        "+${forecast.minTemp.toInt()}°",
                                        style: const TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is ForecastError) {
              return const Center(
                child: Text(
                  "Failed to load forecast",
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