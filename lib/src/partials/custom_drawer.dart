import 'package:flutter/material.dart';

Widget CustomDrawer({BuildContext pageContext}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text('DevTravel', style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica Neue'
              ),),

              Text('Versão 1.0', style: TextStyle(
                color: Color(0xffc2c2c2),
                fontSize: 12,
                fontFamily: 'Helvetica Neue'
              ),),
            ],
          ),
        ),

        ListTile(
          leading: Icon(Icons.home, color: Colors.black,),
          title: Text('Home'),
          onTap: (){
            Navigator.pushReplacementNamed(pageContext, '/home');
          },
        ),

        ListTile(
          leading: Icon(Icons.public, color: Colors.black,),
          title: Text('Escolher Continente'),
          onTap: (){
            Navigator.pushReplacementNamed(pageContext, '/continent');
          },
        ),

        ListTile(
          leading: Icon(Icons.search, color: Colors.black,),
          title: Text('Buscar Cidades'),
          onTap: (){
            Navigator.pushReplacementNamed(pageContext, '/search');
          },
        ),

        ListTile(
          leading: Icon(Icons.favorite, color: Colors.black,),
          title: Text('Cidades Salvas'),
          onTap: (){
            Navigator.pushReplacementNamed(pageContext, '/favorites');
          },
        ),
      ],
    ),
  );
}