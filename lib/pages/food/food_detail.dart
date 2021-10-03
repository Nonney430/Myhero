import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_item.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({Key? key}) : super(key: key);
  static const routeName = '/food_details_page';

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as FoodItem;

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
                Text("ชื่อเมนู: ${item.name}",
                    style: Theme.of(context).textTheme.headline6),
                Text("ราคา: ${item.price} บาท",
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
