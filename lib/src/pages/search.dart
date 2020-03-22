import 'package:devtravel/src/models/appdata.dart';
import 'package:devtravel/src/partials/custom_appbar.dart';
import 'package:devtravel/src/partials/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {


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
          title: 'Busque uma Cidade',
          hideSearch: true
        ),

        drawer: CustomDrawer(pageContext: context),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text('Busca...')

            ],
          ),
        ),
      ),
    );
  }
}