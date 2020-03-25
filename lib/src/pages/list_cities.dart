import 'package:devtravel/src/models/appdata.dart';
import 'package:devtravel/src/partials/city_box.dart';
import 'package:devtravel/src/partials/custom_appbar.dart';
import 'package:devtravel/src/partials/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCities extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final TextStyle styles = TextStyle(
    fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue'
  );

  void cityBoxAction(BuildContext context, cityData) {
    Navigator.pushNamed(context, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    final continentIndex = ModalRoute.of(context).settings.arguments;

    return Consumer<AppData>(builder: (ctx, appData, child) {

      var cities = [];

      for(var country in appData.data[continentIndex]['countries']) {
        cities.addAll(country["cities"]);
      }

      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: "${appData.data[continentIndex]['name']} (${cities.length} cidades)",
            hideSearch: false,
            showBack: true
        ),

        drawer: CustomDrawer(pageContext: context),
        body: GridView.count(
          crossAxisCount: 3,
          physics: BouncingScrollPhysics(),
          children: List.generate(cities.length, (index) {
            return CityBox(
              data: cities[index],
              //cityData é o data lá no Widget CityBox
              onTap: (cityData){ 
                cityBoxAction(context, cityData);
              },
            );
          }),
        ),
      );
    });
  }
}
