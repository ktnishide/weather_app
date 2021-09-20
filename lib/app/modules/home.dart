import 'package:flutter/material.dart';

import 'weather/city_list_page.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return CityListPage(title: title);
  }
}
