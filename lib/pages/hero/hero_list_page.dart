import 'package:flutter/material.dart';
import 'package:flutter_food/models/hero_item.dart';
import 'package:flutter_food/pages/food/hero_detail.dart';
import 'package:flutter_food/services/api.dart';
import 'package:http/http.dart' as http;

class HeroListPage extends StatefulWidget {
  const
  HeroListPage( {Key? key}) : super(key: key);

  @override
  _HeroListPageState createState() => _HeroListPageState();
}

class _HeroListPageState extends State<HeroListPage> {


  var hero_items = [
    HeroItem(id: 1, name: "Toshinori Yagi", alias: "All Might", affiliation: "U.A. High School", bloodtype: "A", gender: "Male", occupation: "Pro Hero, Teacher", quirk: "Quirkless, One For All", image: "1.jpg"),
    HeroItem(id: 2, name: "Izuku Midoriya", alias: "Deku", affiliation: "U.A. High School", bloodtype: "O", gender: "Male", occupation: "Student", quirk: "Quirkless, One For All, Blackwhip", image: "2.jpg"),
    HeroItem(id: 3, name: "Katsuki Bakugo", alias: "Kacchan", affiliation: "U.A. High School", bloodtype: "A", gender: "Male", occupation: "Student", quirk: "Explosion", image: "3.jpg"),
    HeroItem(id: 4, name: "Eijiro Kirishima", alias: "Sturdy Hero: Red Riot", affiliation: "U.A. High School", bloodtype: "O", gender: "Male", occupation: "Student", quirk: "Hardening", image: "4.jpg"),
    HeroItem(id: 5, name: "Fumikage Tokoyami", alias: "Jet-Black Hero: Tsukuyomi", affiliation: "U.A. High School", bloodtype: "AB", gender: "Male", occupation: "Student", quirk: "Dark Shadow", image: "5.jpg"),
    HeroItem(id: 6, name: "Denki Kaminari", alias: "Stun Gun Hero: Chargebolt", affiliation: "U.A. High School", bloodtype: "O", gender: "Male", occupation: "Student", quirk: "Electrification", image: "6.jpg"),
    HeroItem(id: 7, name: "Hanta Sero", alias: "Taping Hero: Cellophane", affiliation: "U.A. High School", bloodtype: "B", gender: "Male", occupation: "Student", quirk: "Tape", image: "7.jpg"),
    HeroItem(id: 8, name: "Mashirao Ojiro", alias: "Martial Arts Hero: Tailman", affiliation: "U.A. High School", bloodtype: "O", gender: "Male", occupation: "Student", quirk: "Tail", image: "8.jpg"),
    HeroItem(id: 9, name: "Mezo Shoji", alias: "Tentacle Hero: Tentacole", affiliation: "U.A. High School", bloodtype: "B", gender: "Male", occupation: "Student", quirk: "Dupli-Arms", image: "9.jpg"),
    HeroItem(id: 10, name: "Yuga Aoyama", alias: "Shining Hero: Can't Stop Twinkling", affiliation: "U.A. High School", bloodtype: "O", gender: "Male", occupation: "Student", quirk: "Navel Laser", image: "10.jpg"),
    HeroItem(id: 11, name: "Mina Ashido", alias: "Ridley Hero: Alien Queen", affiliation: "U.A. High School", bloodtype: "AB", gender: "Female", occupation: "Student", quirk: "Acid", image: "11.jpg"),
    HeroItem(id: 12, name: "Tsuyu Asui", alias: "Rainy Season Hero: Froppy", affiliation: "Salty Banks Middle School", bloodtype: "B", gender: "Female", occupation: "Student", quirk: "Frog", image: "12.jpg"),
    HeroItem(id: 13, name: "Tenya Iida", alias: "Tenya", affiliation: "U.A. High School", bloodtype: "A", gender: "Male", occupation: "Student", quirk: "Engine", image: "13.jpg"),
    HeroItem(id: 14, name: "Ochaco Uraraka", alias: "Uravity", affiliation: "U.A. High School", bloodtype: "B", gender: "Female", occupation: "Student", quirk: "Zero Gravity", image: "14.jpg"),
    HeroItem(id: 15, name: "Rikido Sato", alias: "Sweets Hero: Sugarman", affiliation: "U.A. High School", bloodtype: "O", gender: "Male", occupation: "Student", quirk: "Sugar Rush", image: "15.jpg"),
    HeroItem(id: 16, name: "Shoto Todoroki", alias: "Shoto", affiliation: "U.A. High School", bloodtype: "O", gender: "Male", occupation: "Student", quirk: "Half-Cold Half-Hot", image: "16.jpg"),
    HeroItem(id: 17, name: "Toru Hagakure", alias: "Stealth Hero: Invisible Girl", affiliation: "U.A. High School", bloodtype: "A", gender: "Female", occupation: "Student", quirk: "Invisibility", image: "17.jpg"),
    HeroItem(id: 18, name: "Minoru Mineta", alias: "Fresh-Picked Hero: Grape Juice", affiliation: "U.A. High School", bloodtype: "Unknown", gender: "Male", occupation: "Student", quirk: "Pop Off", image: "18.jpg"),
    HeroItem(id: 19, name: "Momo Yaoyorozu", alias: "Everything Hero: Creati", affiliation: "U.A. High School", bloodtype: "A", gender: "Female", occupation: "Student", quirk: "Creation", image: "19.jpg"),
    HeroItem(id: 20, name: "Shota Aizawa", alias: "Eraser Head", affiliation: "U.A. High School", bloodtype: "B", gender: "Male", occupation: "Pro Hero, Teacher", quirk: "Erasure", image: "20.jpg"),
    HeroItem(id: 21, name: "Tsunagu Hakamada", alias: "Fiber Hero: Best Jeanist", affiliation: "Unknown", bloodtype: "AB", gender: "Male", occupation: "Pro Hero", quirk: "Fiber Master", image: "21.jpg"),
    HeroItem(id: 22, name: "Enji Todoroki", alias: "Flame Hero: Endeavor", affiliation: "Unknown", bloodtype: "AB", gender: "Male", occupation: "Pro Hero", quirk: "Hellflame", image: "22.jpg"),
    HeroItem(id: 23, name: "Nemuri Kayama", alias: "R-Rated Hero: Midnight", affiliation: "U.A. High School", bloodtype: "A", gender: "Female", occupation: "Pro Hero, Teacher", quirk: "Somnambulist", image: "23.jpg"),
    HeroItem(id: 24, name: "Hizashi Yamada", alias: "Voice Hero: Present Mic", affiliation: "U.A. High School", bloodtype: "B", gender: "Male", occupation: "Pro Hero, Teacher", quirk: "Voice", image: "24.jpg"),
    HeroItem(id: 25, name: "Ken Ishiyama", alias: "Cementoss", affiliation: "U.A. High School", bloodtype: "B", gender: "Male", occupation: "Pro Hero, Teacher", quirk: "Cement", image: "25.jpg"),
    HeroItem(id: 26, name: "Snipe", alias: "Unknown", affiliation: "U.A. High School", bloodtype: "A", gender: "Male", occupation: "Pro Hero, Teacher", quirk: "Homing", image: "26.jpg"),
    HeroItem(id: 27, name: "Ectoplasm", alias: "Unknown", affiliation: "U.A. High School", bloodtype: "AB", gender: "Male", occupation: "Pro Hero, Teacher", quirk: "Clones", image: "27.jpg"),
    HeroItem(id: 28, name: "Sekijiro Kan", alias: "Blood Hero: Vlad King", affiliation: "U.A. High School", bloodtype: "B", gender: "Male", occupation: "Pro Hero, Teacher", quirk: "Blood Control", image: "28.jpg"),
    HeroItem(id: 29, name: "Sorahiko Torino", alias: "Gran Torino", affiliation: "U.A. High School", bloodtype: "B", gender: "Male", occupation: "Pro Hero", quirk: "Jet", image: "29.jpg"),
    HeroItem(id: 30, name: "Mirio Togata", alias: "Lemillion", affiliation: "U.A. High School", bloodtype: "O", gender: "Male", occupation: "Student", quirk: "Permeation, Quirkless", image: "30.jpg"),
    HeroItem(id: 31, name: "Nejire Hado", alias: "Nejire Chan", affiliation: "U.A. High School", bloodtype: "B", gender: "Female", occupation: "Student", quirk: "Wave Motion", image: "31.jpg"),
    HeroItem(id: 32, name: "Tamaki Amajiki", alias: "Suneater", affiliation: "U.A. High School", bloodtype: "AB", gender: "Male", occupation: "Student", quirk: "Manifest", image: "32.jpg"),


  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: hero_items.length,
        itemBuilder: (BuildContext context,int index) {
          HeroItem item = hero_items[index];

          return Card(
            margin: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                print(item);
                Navigator.pushNamed(
                  context,
                  FoodDetail.routeName,
                arguments: item,
                );

              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/${item.image}',
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                          ),
                          Text(
                            "${item.alias.toString()}",style: Theme.of(context).textTheme.headline1
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
