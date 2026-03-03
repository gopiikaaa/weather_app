import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/city_search/city_search_bloc.dart';
import '../bloc/city_search/city_search_event.dart';
import '../bloc/city_search/city_search_state.dart';

class CitySearchView extends StatefulWidget {
  const CitySearchView({super.key});

  @override
  State<CitySearchView> createState() => _CitySearchViewState();
}

class _CitySearchViewState extends State<CitySearchView> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("City Search")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Enter city",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {

                    context.read<CitySearchBloc>().add(
                      SearchCityEvent(controller.text),
                    );

                  },
                  child: const Text("Search"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<
                  CitySearchBloc,
                  CitySearchState>(
                builder: (context, state) {

                  if (state is CityLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is CityLoaded) {

                    return ListView.builder(
                      itemCount: state.cities.length,
                      itemBuilder: (context, index) {

                        final city = state.cities[index];

                        return ListTile(
                          title: Text(city.name),
                          subtitle: Text(city.country),
                        );
                      },
                    );
                  }

                  if (state is CityError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}