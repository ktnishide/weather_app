import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/home.dart';
import 'modules/weather/viewmodel/city_list_viewmodel.dart';
import 'modules/weather/viewmodel/city_search_viewmodel.dart';
import 'shared/service/snackbar_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CitySearchViewModel>(
              create: (_) => CitySearchViewModel()),
          ChangeNotifierProvider<CityListViewModel>(
              create: (context) => CityListViewModel())
        ],
        child: MaterialApp(
          title: 'Weather app',
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home(title: 'Weather app'),
        ));
  }
}
