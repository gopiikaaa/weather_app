import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../bloc/city_search/city_search_bloc.dart';
import '../bloc/city_search/city_search_event.dart';
import '../bloc/city_search/city_search_state.dart';

class CitySearchView extends StatelessWidget {
  const CitySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Stack(
      children: [

        
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1C1C3C),
                Color(0xFF0F2027),
                Color(0xFF000000),
              ],
            ),
          ),
        ),

       
        Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(
            title: const Text(StringConstants.kCitySearch,
            style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,   
      ),
    ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          body: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [

               
                TextField(
                  controller: controller,
                  onChanged: (value) {
                    
                      context.read<CitySearchBloc>().add(
                        SearchCityEvent(value),
                      );
                    },
                  

                  decoration: InputDecoration(
                    hintText: StringConstants.kEnterCity,
                    hintStyle: const TextStyle(
                    color: Colors.white70,),

                    prefixIcon: const Icon(Icons.search, color: Colors.white),

                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.white),
                      onPressed: () {
                        controller.clear();
                         context.read<CitySearchBloc>().add(
                          SearchCityEvent(""),
                         );
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
                ),

                const SizedBox(height: 20),

                
                Expanded(
                  child: BlocBuilder<CitySearchBloc, CitySearchState>(
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

                            return Card(
                              color: Colors.white.withOpacity(0.15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: ListTile(
                                title: Text(
                                  city.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  city.country,
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ),
                            );
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
      ],
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
