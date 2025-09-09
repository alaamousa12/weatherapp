import 'package:flutter/material.dart';

class OnWeatherBody extends StatelessWidget {
  const OnWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("there is on weather 😔 start", style: TextStyle(fontSize: 20)),
          Text("searching now 🔍", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
