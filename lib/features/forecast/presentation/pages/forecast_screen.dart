import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/forecast_remote_datasource.dart';
import '../../data/repositories/forecast_repository_impl.dart';
import '../../domain/usecases/get_forecast_usecase.dart';
import '../bloc/forecast_bloc.dart';
import '../bloc/forecast_event.dart';
import '../widgets/forecast_view.dart';

@RoutePage()
class ForecastScreen extends StatelessWidget {

  const ForecastScreen({
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

    final datasource = ForecastRemoteDatasource(dioClient);

    final repository = ForecastRepositoryImpl(datasource);

    final usecase = GetForecastUseCase(repository);

    return BlocProvider(
      create: (_) => ForecastBloc(usecase)
        ..add(GetForecastEvent(
          latitude: latitude,
          longitude: longitude,
        )),
      child: ForecastView(cityName: cityName, latitude: latitude,longitude: longitude,),
    );
  }
}