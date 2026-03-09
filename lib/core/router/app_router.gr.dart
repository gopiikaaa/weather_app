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
class ForecastRoute extends PageRouteInfo<ForecastRouteArgs> {
  ForecastRoute({
    required double latitude,
    required double longitude,
    required String cityName,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ForecastRoute.name,
         args: ForecastRouteArgs(
           latitude: latitude,
           longitude: longitude,
           cityName: cityName,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ForecastRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForecastRouteArgs>();
      return ForecastScreen(
        latitude: args.latitude,
        longitude: args.longitude,
        cityName: args.cityName,
        key: args.key,
      );
    },
  );
}

class ForecastRouteArgs {
  const ForecastRouteArgs({
    required this.latitude,
    required this.longitude,
    required this.cityName,
    this.key,
  });

  final double latitude;

  final double longitude;

  final String cityName;

  final Key? key;

  @override
  String toString() {
    return 'ForecastRouteArgs{latitude: $latitude, longitude: $longitude, cityName: $cityName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForecastRouteArgs) return false;
    return latitude == other.latitude &&
        longitude == other.longitude &&
        cityName == other.cityName &&
        key == other.key;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ cityName.hashCode ^ key.hashCode;
}

/// generated route for
/// [WeatherScreen]
class WeatherRoute extends PageRouteInfo<WeatherRouteArgs> {
  WeatherRoute({
    required double latitude,
    required double longitude,
    required String cityName,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         WeatherRoute.name,
         args: WeatherRouteArgs(
           latitude: latitude,
           longitude: longitude,
           cityName: cityName,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'WeatherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeatherRouteArgs>();
      return WeatherScreen(
        latitude: args.latitude,
        longitude: args.longitude,
        cityName: args.cityName,
        key: args.key,
      );
    },
  );
}

class WeatherRouteArgs {
  const WeatherRouteArgs({
    required this.latitude,
    required this.longitude,
    required this.cityName,
    this.key,
  });

  final double latitude;

  final double longitude;

  final String cityName;

  final Key? key;

  @override
  String toString() {
    return 'WeatherRouteArgs{latitude: $latitude, longitude: $longitude, cityName: $cityName, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeatherRouteArgs) return false;
    return latitude == other.latitude &&
        longitude == other.longitude &&
        cityName == other.cityName &&
        key == other.key;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ cityName.hashCode ^ key.hashCode;
}
