class Ingredient {
  final int id;
  final String name;
  final int isAllergen;
  final int isVegan;
  final int hasMilk;
  final int hasEgg;
  final int hasGluten;
  final int hasSeafood;
  final int hasFish;
  final int hasSugar;
  final int hasSoy;
  final int hasNuts;

  Ingredient(
      {required this.id,
      required this.name,
      required this.isAllergen,
      required this.isVegan,
      required this.hasMilk,
      required this.hasEgg,
      required this.hasGluten,
      required this.hasSeafood,
      required this.hasFish,
      required this.hasSugar,
      required this.hasSoy,
      required this.hasNuts});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
        id: json['idStamp'],
        name: json['name'],
        isAllergen: json['isAllergen'],
        isVegan: json['isVegan'],
        hasMilk: json['hasMilk'],
        hasEgg: json['hasEgg'],
        hasGluten: json['hasGluten'],
        hasSeafood: json['hasSeafood'],
        hasFish: json['hasFish'],
        hasSugar: json['hasSugar'],
        hasSoy: json['hasSoy'],
        hasNuts: json['hasNuts']);
  }
}
