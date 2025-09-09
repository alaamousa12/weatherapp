import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:news/main.dart';
import 'package:news/views/search_view.dart';
import 'package:news/widgets/on_weather_body.dart';
import 'package:news/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: getThemeColor(
              (state is WeatherLoadedState)
                  ? state.weatherModel.weatherCondition
                  : null,
            ),
            title: const Text(
              'Weather App',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchView()),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: BlocBuilder<GetWeatherCubit , WeatherState>(
            builder: (context , state) {
              if (state is WeatherInitialState) {
                return const OnWeatherBody();
              } else if (state is WeatherLoadedState) {
                return WeatherInfoBody(weather: state.weatherModel);
              } else {
                return Center(child: const Text('Opps there was an error'));
              }
            },
          ),
        );
      },
    );
  }
}
