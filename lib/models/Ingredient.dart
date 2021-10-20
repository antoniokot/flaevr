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
      {this.id,
      this.name,
      this.isAllergen,
      this.isVegan,
      this.hasMilk,
      this.hasEgg,
      this.hasGluten,
      this.hasSeafood,
      this.hasFish,
      this.hasSugar,
      this.hasSoy,
      this.hasNuts});

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
