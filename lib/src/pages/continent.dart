import 'package:devtravel/src/models/appdata.dart';
import 'package:devtravel/src/partials/city_box.dart';
import 'package:devtravel/src/partials/custom_appbar.dart';
import 'package:devtravel/src/partials/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinentPage extends StatelessWidget {


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  void seeCityAction(BuildContext context, continentIndex) {
    Navigator.pushNamed(context, '/list_cities', arguments: continentIndex);
  }

  void cityBoxAction(cityData) {

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appData, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Escolha um continente',
          hideSearch: false
        ),

        drawer: CustomDrawer(pageContext: context),

        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: appData.data.length,
          itemBuilder: (context, index) {        
            var cities = [];
            for(var country in appData.data[index]['countries']) {
              cities.addAll(country['cities']);
            }

            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        '${appData.data[index]['name']} (${cities.length})',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica Neue'
                        ),
                      ),
                    ),

                    FlatButton(
                      child: Text(
                        'Ver Cidades',
                        style: TextStyle(
                          fontFamily: 'Helvetica Neue',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                        ),),
                      onPressed: () {
                        seeCityAction(context, index);
                      },
                    )
                    
                  ],
                ),

                //lista das cidades
                Container(
                  height: 150,
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: cities.length,
                    itemBuilder: (cityContext, cityIndex) {

                      return CityBox(
                        data: cities[cityIndex],
                        onTap: ( cityData ) {
                          cityBoxAction(cityData);
                        }
                      );
                      
                    },
                  ),
                )
              ],
            );
          },
        )
      ),
    );
  }
}