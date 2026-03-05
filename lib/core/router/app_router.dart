import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/city_search/presentation/pages/city_search_screen.dart';
import '../../features/forecast/presentation/pages/forecast_screen.dart';
import '../../features/weather/presentation/pages/weather_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CitySearchRoute.page, initial: true),

    AutoRoute(page: WeatherRoute.page),

    AutoRoute(page: ForecastRoute.page),
  ];
}
