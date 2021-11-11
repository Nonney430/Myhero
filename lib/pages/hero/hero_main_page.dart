import 'dart:convert';

import 'package:flutter/material.dart';

import 'hero_list_page.dart';
import 'package:http/http.dart' as http;

class FoodMainPage extends StatefulWidget {
  const FoodMainPage({Key? key}) : super(key: key);

  @override
  _FoodMainPageState createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: HeroListPage()
          
    );
  }


}
