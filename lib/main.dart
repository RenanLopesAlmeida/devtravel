import 'package:devtravel/src/pages/list_cities.dart';
import 'package:devtravel/src/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/models/appdata.dart';

import 'src/pages/continent.dart';
import 'src/pages/home.dart';
import 'src/pages/preload.dart';




void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppData(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/preload': (context) => PreloadPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/continent': (context) => ContinentPage(),
        '/list_cities': (context) => ListCities()
      },
      initialRoute: '/preload',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white
      ),
    );
  }
}
