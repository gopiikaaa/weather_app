import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/widget_constants/city_tile.dart';
import '../../../../core/constants/widget_constants/gradient_background.dart';
import '../../../../core/constants/widget_constants/search_text_field.dart';
import '../bloc/city_search/city_search_bloc.dart';
import '../bloc/city_search/city_search_state.dart';

class CitySearchView extends StatelessWidget {
  const CitySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          title: const Text(
            StringConstants.kCitySearch,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
             
              CitySearchTextField(controller: controller),

              const SizedBox(height: 20),

              
              Expanded(
                child: BlocBuilder<CitySearchBloc, CitySearchState>(
                  builder: (context, state) {
                    if (state is CityLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is CityLoaded) {
                      return ListView.builder(
                        itemCount: state.cities.length,
                        itemBuilder: (context, index) {
                          return CityTile(city: state.cities[index]);
                        },
                      );
                    }

                    if (state is CityError) {
                      return const Center(
                        child: Text(
                          StringConstants.kErrorMessage,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return const Center(
                      child: Text(
                        StringConstants.kSearchCityTag,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

            //     ElevatedButton(
            //       onPressed: () {
            //         context.read<CitySearchBloc>().add(
            //           SearchCityEvent(controller.text),
            //         );
            //       },
            //       child: const Text(StringConstants.kSearch),
            //     ),
            //   ],
            // ),
           // const SizedBox(height: 20),
           
//////////////// 
///
// class TestWidState extends StatefulWidget {
//   const TestWidState({super.key});

//   @override
//   State<TestWidState> createState() => _TestWidStateState();
// }

// class _TestWidStateState extends State<TestWidState> {
//   bool isClicked = false;
//   @override
//   Widget build(BuildContext context) {
//     setState(() {});

//     return Row(
//       children: [
//         Container(color: Colors.green, width: 100, height: 100),
//         Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [Colors.blueGrey, Colors.black26]),
//           ),
//           width: 100,
//           height: 100,
//           // color: isClicked ? Colors.amber : Colors.lightBlueAccent,
//         ),
//         ElevatedButton(
//           onPressed: () {
//             print("Button Pressed");
//             setState(() {
//               isClicked = !isClicked;
//             });
//           },
//           child: const Text('click'),
//         ),
//         const Icon(Icons.access_alarm),
//       ],
//     );
//   }
// }