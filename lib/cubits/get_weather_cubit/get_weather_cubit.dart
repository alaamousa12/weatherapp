import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:news/models/weather_model.dart';
import 'package:news/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
   WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getCurrentWeather(
        cityName: cityName,
      );
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
