import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../features/city_search/presentation/bloc/city_search/city_search_bloc.dart';
import '../../../features/city_search/presentation/bloc/city_search/city_search_event.dart';


class CitySearchTextField extends StatelessWidget {
  const CitySearchTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        context.read<CitySearchBloc>().add(SearchCityEvent(value));
      },
      decoration: InputDecoration(
        hintText: StringConstants.kEnterCity,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear, color: Colors.white),
          onPressed: () {
            controller.clear();
            context.read<CitySearchBloc>().add(SearchCityEvent(""));
          },
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}