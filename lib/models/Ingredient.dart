class Ingredient {
  final int id;
  final String name;
  final int isAllergen;
  final int isVegan;

  Ingredient({
    this.id,
    this.name,
    this.isAllergen,
    this.isVegan,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['idStamp'],
      name: json['name'],
      isAllergen: json['isAllergen'],
      isVegan: json['isVegan'],
    );
  }
}
