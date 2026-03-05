// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CitySearchScreen]
class CitySearchRoute extends PageRouteInfo<void> {
  const CitySearchRoute({List<PageRouteInfo>? children})
    : super(CitySearchRoute.name, initialChildren: children);

  static const String name = 'CitySearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CitySearchScreen();
    },
  );
}

/// generated route for
/// [ForecastScreen]
class ForecastRoute extends PageRouteInfo<void> {
  const ForecastRoute({List<PageRouteInfo>? children})
    : super(ForecastRoute.name, initialChildren: children);

  static const String name = 'ForecastRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForecastScreen();
    },
  );
}

/// generated route for
/// [WeatherScreen]
class WeatherRoute extends PageRouteInfo<WeatherRouteArgs> {
  WeatherRoute({
    Key? key,
    required double latitude,
    required double longitude,
    required String cityName,
    List<PageRouteInfo>? children,
  }) : super(
         WeatherRoute.name,
         args: WeatherRouteArgs(
           key: key,
           latitude: latitude,
           longitude: longitude,
           cityName: cityName,
         ),
         initialChildren: children,
       );

  static const String name = 'WeatherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeatherRouteArgs>();
      return WeatherScreen(
        key: args.key,
        latitude: args.latitude,
        longitude: args.longitude,
        cityName: args.cityName,
      );
    },
  );
}

class WeatherRouteArgs {
  const WeatherRouteArgs({
    this.key,
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });

  final Key? key;

  final double latitude;

  final double longitude;

  final String cityName;

  @override
  String toString() {
    return 'WeatherRouteArgs{key: $key, latitude: $latitude, longitude: $longitude, cityName: $cityName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeatherRouteArgs) return false;
    return key == other.key &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        cityName == other.cityName;
  }

  @override
  int get hashCode =>
      key.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ cityName.hashCode;
}
