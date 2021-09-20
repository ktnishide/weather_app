import 'dart:convert';

import '../model/city_weather_model.dart';

abstract class IOpenWeatherRepository {
  Future<CityWeatherModel> getWeatherByLocation(Coord coord);
  Future<CityWeatherModel> getWeatherByCityName(String city);
}

class OpenWeatherRepositoryHttp extends IOpenWeatherRepository {
  OpenWeatherRepositoryHttp(this.httpClient);
  static const endPointUrl = 'https://api.openweathermap.org/data/2.5';
  static const apiKey =
      "<insert api_id here>"; // TODO: get it in a more secure way (remote config, pass vault, etc...)
  final httpClient;

  @override
  Future<CityWeatherModel> getWeatherByLocation(Coord coord) async {
    final requestUrl =
        '$endPointUrl/weather?lat=${coord.lat}&lon=${coord.lon}&units=metric&APPID=$apiKey';
    final response = await this.httpClient.get(Uri.parse(requestUrl));

    if (response.statusCode != 200) {
      throw Exception(
          'error retrieving weather for location $coord: ${response.statusCode}');
    }

    return CityWeatherModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<CityWeatherModel> getWeatherByCityName(String city) async {
    final requestUrl =
        '$endPointUrl/weather?q=$city&units=metric&units=metric&APPID=$apiKey';
    final response = await this.httpClient.get(Uri.parse(requestUrl));

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: ${response.statusCode}');
    }

    return CityWeatherModel.fromJson(jsonDecode(response.body));
  }
}
