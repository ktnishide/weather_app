import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/modules/weather/viewmodel/city_list_viewmodel.dart';

class CityListView extends StatelessWidget {
  CityListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CityListViewModel>(
        builder: (context, value, child) => Expanded(
              child: (value.loading ?? false)
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: value.cities.length,
                      itemBuilder: (context, index) => ListTile(
                            onTap: () {},
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text([
                                  value.cities[index].name,
                                  value.cities[index].sys?.country
                                ]
                                    .where((element) =>
                                        element?.isNotEmpty ?? false)
                                    .join(', ')),
                                Text(
                                    value.cities[index].main?.temp.toString() ??
                                        ''),
                              ],
                            ),
                          )),
            ));
  }
}
