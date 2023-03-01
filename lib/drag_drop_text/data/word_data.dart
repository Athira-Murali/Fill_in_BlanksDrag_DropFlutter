enum ClimateType { summer, winter }

class WordClimate {
  final String? word;
  final ClimateType? type;
  WordClimate({this.word, this.type});

  final items = [
    ItemModel(word: 'sun-glass', name: "summer", value: "Summer"),
    ItemModel(word: 'woolen clothes', name: "winter", value: "Winter"),
    ItemModel(word: 'ice-cream', name: "summer", value: "Summer"),
    ItemModel(word: 'raincoats', name: "winter", value: "Winter"),
    ItemModel(word: 'cotton clothes', name: "summer", value: "Summer"),
    ItemModel(word: 'sweater', name: "winter", value: "Winter"),
    ItemModel(word: 'cool-drinks', name: "summer", value: "Summer"),
    ItemModel(word: 'umbrella', name: "winter", value: "Winter"),
    // ItemModel(, name: "Cat", value: "Cat"),
    // ItemModel(
    //     , name: "Cake", value: "Cake"),
    // ItemModel(.bus, name: "bus", value: "bus"),
  ];
}

class ItemModel {
  final String name;
  final String value;
  final String word;

  // final IconData icon;
  bool accepting;

  ItemModel(
      {required this.name,
      required this.value,
      required this.word,
      // required this.icon,
      this.accepting = false});
}
