import 'package:devtravel/src/models/appdata.dart';
import 'package:devtravel/src/partials/custom_appbar.dart';
import 'package:devtravel/src/partials/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  TextStyle styles = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Helvetica Neue'
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appData, child) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          pageContext: context,
          title: 'Home',
          hideSearch: false
        ),

        drawer: CustomDrawer(pageContext: context),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Text('Bem vindo(a) ao', style: styles,),
              ),

              Image.asset('lib/assets/devstravel_logo.png', width: 200,),

              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Seu guia de viagem perfeito', style: styles,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}