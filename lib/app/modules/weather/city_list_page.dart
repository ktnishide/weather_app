import 'package:flutter/material.dart';

import 'view/city_list_view.dart';

class CityListPage extends StatelessWidget {
  CityListPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CityListView(),
        ],
      ),
    );
  }
}
