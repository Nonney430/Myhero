import 'package:flutter/material.dart';
import 'package:flutter_food/pages/hero/hero_detail.dart';
import 'package:flutter_food/pages/home/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY HERO ACADEMIA',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.black,
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,

          ),
          headline6: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.bold,
            color: Colors.yellowAccent,
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,

          ),

        ),
      ),
      //home: LoginPage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        HeroDetail.routeName: (context) => const HeroDetail(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
