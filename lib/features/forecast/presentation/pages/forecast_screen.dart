import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Forecast Screen"),
      ),

      body: const Center(
        child: Text(
          "This is Forecast Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),

    );
  }
}