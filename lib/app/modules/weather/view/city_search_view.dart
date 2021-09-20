import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/modules/weather/viewmodel/city_search_view_model.dart';

class CitySearchView extends StatefulWidget {
  @override
  _CitySearchViewState createState() => _CitySearchViewState();
}

class _CitySearchViewState extends State<CitySearchView> {
  TextEditingController cityEditController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // sync the current value in text field to
    // the view model
    cityEditController.addListener(() {
      Provider.of<CitySearchViewModel>(this.context, listen: false)
          .updateCity(cityEditController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CitySearchViewModel>(
        builder: (context, model, child) => Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            padding: EdgeInsets.only(left: 5, top: 5, right: 20, bottom: 00),
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3),
                  topRight: Radius.circular(3),
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: new Icon(Icons.search),
                  onPressed: () {
                    model.updateCity(cityEditController.text);
                    model.addCityWeather(cityEditController.text, context);
                  },
                ),
                SizedBox(width: 10),
                Expanded(
                    child: TextField(
                        controller: cityEditController,
                        decoration: InputDecoration.collapsed(
                            hintText: "Enter City/Location"),
                        onSubmitted: (String city) =>
                            model.addCityWeather(city, context))),
              ],
            )));
  }
}
