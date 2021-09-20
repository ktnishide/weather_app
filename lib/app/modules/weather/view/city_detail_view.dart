import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/modules/weather/viewmodel/city_list_viewmodel.dart';

class CityDetailView extends StatefulWidget {
  const CityDetailView({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _CityDetailViewState createState() => _CityDetailViewState();
}

class _CityDetailViewState extends State<CityDetailView> {
  late bool isInitState = true;
  final appBar = AppBar();
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isInitState = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double bodySize = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    return Scaffold(
        appBar: appBar,
        body: Consumer<CityListViewModel>(builder: (context, value, child) {
          if (value.loading ?? false) {
            return const Center(child: CircularProgressIndicator());
          }

          final _data = value.cities[widget.id].toJson();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isInitState = !isInitState;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  color: isInitState ? Colors.red : Colors.white,
                  width: isInitState ? 50 : 100,
                  height: isInitState ? 50 : bodySize,
                  curve: Curves.bounceInOut,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: _data.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .2,
                                          child: Flexible(
                                              child: Text(
                                            _data.keys
                                                .toList()[index]
                                                .toString(),
                                            softWrap: true,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                        Expanded(
                                            child: Text(
                                                _data.values
                                                    .toList()[index]
                                                    .toString(),
                                                softWrap: true)),
                                      ]),
                                )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
