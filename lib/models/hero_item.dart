class HeroItem {
  final int id;
  final String name;
  final String alias;
  final String affiliation;
  final String bloodtype;
  final String gender;
  final String occupation;
  final String quirk;
  final String image;

  HeroItem({
    required this.id,
    required this.name,
    required this.alias,
    required this.affiliation,
    required this.bloodtype,
    required this.gender,
    required this.occupation,
    required this.quirk,
    required this.image,
  });
  factory HeroItem.fromJson(Map<String, dynamic> json) {
    return HeroItem(
      id: json['id'],
      name: json['name'],
      alias: json['alias'],
      affiliation: json['name'],
      bloodtype: json['bloodtype'],
      gender: json['gender'],
      occupation: json['occupation'],
      quirk: json['quirk'],
      image: json['image'],
    );
  }

}
