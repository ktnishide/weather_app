import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'city_list_viewmodel.dart';

class CitySearchViewModel with ChangeNotifier {
  String? _city;

  CitySearchViewModel();

  String get city => _city ?? '';

  void addCityWeather(String newCity, BuildContext context) {
    Provider.of<CityListViewModel>(context, listen: false).addCity(city);
    notifyListeners();
  }

  void updateCity(String newCity) {
    _city = newCity;
  }
}
