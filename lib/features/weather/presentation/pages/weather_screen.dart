import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/weather_remote_datasource.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/usecases/get_weather_usecase.dart';
import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../widgets/weather_view.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    required this.latitude,
    required this.longitude,
    required this.cityName,
    super.key,
  });

  final double latitude;
  final double longitude;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    final dioClient = DioClient();

    final remoteDatasource = WeatherRemoteDatasource(dioClient);

    final repository = WeatherRepositoryImpl(remoteDatasource);

    final useCase = GetWeatherUseCase(repository);

    return BlocProvider(
      create: (_) =>
          WeatherBloc(useCase)
            ..add(GetWeatherEvent(latitude: latitude, longitude: longitude)),
      child: WeatherView(cityName: cityName),
    );
  }
}
