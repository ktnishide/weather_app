import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/app/modules/weather/model/city_weather_model.dart';
import 'package:weather_app/app/modules/weather/repository/open_weather_repository.dart';
import 'package:weather_app/app/shared/service/snackbar_service.dart';

class CityListViewModel extends ChangeNotifier {
  CityListViewModel() {
    initData();
  }

  bool? loading = false;
  List<CityWeatherModel> cities = [];
  IOpenWeatherRepository _api = OpenWeatherRepositoryHttp(Client());

  Future<void> initData() async {
    loading = true;
    notifyListeners();
    await addCity('Brisbane,AU');
    await addCity('Melbourne,AU');
    await addCity('Sydney,AU');
    loading = false;
    notifyListeners();
    Timer.periodic(Duration(minutes: 1), (timer) async {
      refreshCities();
    });
  }

  addCity(String searchString) async {
    if (cities.any((element) =>
        element.name!.toUpperCase().contains(searchString.toUpperCase()))) {
      showSnack('City already in the list');
      return;
    }
    loading = true;
    notifyListeners();
    try {
      final city = await _api.getWeatherByCityName(searchString);
      if (cities.any((element) => element.id == city.id)) {
        throw Exception('City already in the list');
      }
      cities.add(city);
    } catch (e) {
      showSnack('Error adding city: ${e.toString()}');
    }
    loading = false;
    notifyListeners();
  }

  refreshCities() async {
    log('refreshing');
    loading = true;
    notifyListeners();
    var _cities = <CityWeatherModel>[];
    for (var city in cities) {
      _cities.add(
          await _api.getWeatherByCityName('${city.name},${city.sys?.country}'));
    }
    cities = _cities;
    loading = false;
    notifyListeners();
  }
}
