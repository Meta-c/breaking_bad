class Character {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late List<dynamic> jobs;
  late String lifeStatus;
  late List<dynamic> appearenceSeasons;
  late String actor;
  late String categoryForTwoSeries;
  late List<dynamic> betterCallSaulAppearence;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    nickName = json['nickname'];
    image = json['img'];
    jobs = json['occupation'];
    lifeStatus = json['status'];
    appearenceSeasons = json['appearance'];
    actor = json['portrayed'];
    categoryForTwoSeries = json['category'];
    betterCallSaulAppearence = json['better_call_saul_appearance'];
  }
}
