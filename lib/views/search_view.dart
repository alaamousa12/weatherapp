import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Search City'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ), // من خارج textfield
        child: Center(
          child: TextField(
            autofocus: true,
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                // padding من داخل textfield
                horizontal: 25,
                vertical: 18,
              ),
              suffixIcon: Icon(Icons.search),
              labelText: 'search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'enter the weather',
              hintStyle: TextStyle(
                color: const Color.fromARGB(255, 188, 174, 174),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
