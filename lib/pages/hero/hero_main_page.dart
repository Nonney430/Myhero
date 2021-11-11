import 'dart:convert';

import 'package:flutter/material.dart';

import 'hero_list_page.dart';
import 'package:http/http.dart' as http;

class HeroMainPage extends StatefulWidget {
  const HeroMainPage({Key? key}) : super(key: key);

  @override
  _HeroMainPageState createState() => _HeroMainPageState();
}

class _HeroMainPageState extends State<HeroMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: HeroListPage()

    );
  }


}
