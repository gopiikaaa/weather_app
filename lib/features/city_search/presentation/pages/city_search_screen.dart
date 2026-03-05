import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/city_remote_datasource.dart';
import '../../data/repositories/city_repository_impl.dart';
import '../bloc/city_search/city_search_bloc.dart';
import '../widgets/city_search_view.dart';

@RoutePage()
class CitySearchScreen extends StatelessWidget {
  const CitySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dioClient = DioClient();
    final remoteDatasource = CityRemoteDatasource(dioClient);
    final repository = CityRepositoryImpl(remoteDatasource);

    return BlocProvider(
      create: (_) => CitySearchBloc(repository),
      child: const CitySearchView(),
      // child: const TestWidState(),
    );
  }
}
