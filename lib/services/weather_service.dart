
import 'package:dio/dio.dart';
import 'package:news/models/weather_model.dart';

class WeatherService {
  Dio dio = Dio();
  final String baseUrl =
      'http://api.weatherapi.com'; // لو عندى اكتر من method ممكن baseUrl يتغير الحل دا بحيث لو حصل تغير اغير فى المتغير و هيسمع معايا فى الباقى
  final String apiKey = '1b2192814d6d488f9cc123255250209';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception('oops there was an error, try later');
    }
  }
}
