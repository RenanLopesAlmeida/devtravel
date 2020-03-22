import 'package:flutter/material.dart';

Widget CustomAppBar(
  {
    GlobalKey<ScaffoldState> scaffoldKey,//vai servir para pegarmos a referencia da pagina em questão para ter acesso ao Scaffold
    BuildContext pageContext,
    String title = '',
    bool hideSearch = true,
    bool showBack = false
  }) {


    void searchAction() {
      Navigator.pushReplacementNamed(pageContext, '/search');
    }

  IconButton drawerIcon = IconButton(
    icon: Icon(
      Icons.menu,
      color: Colors.black,
      size: 30,
    ),
    onPressed: () {
      scaffoldKey.currentState.openDrawer();
    },
  );

  IconButton backIcon = IconButton(
    icon: Icon(
      Icons.arrow_back,
      color: Colors.black,
      size: 30,
    ),
    onPressed: () {
      Navigator.pop(pageContext);
    },
  );

  IconButton leadingButton = drawerIcon;

  if(showBack)
    leadingButton = backIcon;

  return AppBar(
    brightness: (Theme.of(pageContext).platform == TargetPlatform.iOS) ? Brightness.light : Brightness.dark,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'),
    ),

    leading: leadingButton,

    actions: <Widget>[
      (!hideSearch)
          ? IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              onPressed: searchAction,
            )
          : Container()
    ],
  );
}
