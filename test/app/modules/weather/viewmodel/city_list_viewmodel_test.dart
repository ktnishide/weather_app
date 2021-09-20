import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/app/modules/weather/model/city_weather_model.dart';
import 'package:weather_app/app/modules/weather/repository/open_weather_repository.dart';
import 'package:weather_app/app/modules/weather/viewmodel/city_list_viewmodel.dart';

import 'city_list_viewmodel_test.mocks.dart';

@GenerateMocks([OpenWeatherRepositoryHttp])
void main() {
  group('Testing city_list_viewmodel', () {
    final repository = MockOpenWeatherRepositoryHttp();
    final viewModel = CityListViewModel();

    test('Should return initial data', () async {
      when(repository.getWeatherByCityName('Brisbane,AU')).thenAnswer(
          (_) async => CityWeatherModel.fromJson(jsonDecode(mockCityWeather)));
      when(repository.getWeatherByCityName('Melbourne,AU')).thenAnswer(
          (_) async => CityWeatherModel.fromJson(jsonDecode(mockCityWeather)));
      when(repository.getWeatherByCityName('Sydney,AU')).thenAnswer(
          (_) async => CityWeatherModel.fromJson(jsonDecode(mockCityWeather)));

      await viewModel.initData();

      expect(viewModel.cities.length, greaterThan(0));
    });
  });
}
