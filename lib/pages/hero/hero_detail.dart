import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/models/hero_item.dart';

class HeroDetail extends StatelessWidget {
  const HeroDetail({Key? key}) : super(key: key);
  static const routeName = '/food_details_page';

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as HeroItem;

    return Scaffold(
      appBar: AppBar(
        title: Text("${item.name}"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.asset(
                  "assets/images/${item.image}",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Name: ",
                        style: Theme.of(context).textTheme.headline6),
                    Text("${item.name}",
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
                Text("Alias: ${item.alias}",
                    style: Theme.of(context).textTheme.headline6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Affiliation: ",
                        style: Theme.of(context).textTheme.headline6),
                    Text("${item.affiliation}",
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Occupation: ",
                        style: Theme.of(context).textTheme.headline6),
                    Text("${item.occupation}",
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
                Text("Quirk: ${item.quirk}",
                    style: Theme.of(context).textTheme.headline6),
                Text("Bloodtype: ${item.bloodtype}",
                    style: Theme.of(context).textTheme.headline6),
                Text("Gender: ${item.gender}",
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
