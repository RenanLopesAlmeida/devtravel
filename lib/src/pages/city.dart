import 'package:devtravel/src/models/appdata.dart';
import 'package:devtravel/src/partials/custom_appbar.dart';
import 'package:devtravel/src/partials/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityPage extends StatelessWidget {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  final TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> cityData = ModalRoute.of(context).settings.arguments;
    print(cityData['places']);

    return Consumer<AppData>(
      builder: (ctx, appData, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        drawer: CustomDrawer(pageContext: context),

        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.deepPurple
                ),
              ),

              Container(
                height: 50,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 38, color: Colors.white,),
                  onPressed: (){},
                ),
              ),

              ListView(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(top: 220),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)
                    ),

                    child: Container(
                      height: 1000,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}