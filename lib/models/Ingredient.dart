class Ingredient {
  final int idIngredient;
  final String name;
  final int isAllergenic;
  final int isVegan;

  Ingredient({
    this.idIngredient,
    this.name,
    this.isAllergenic,
    this.isVegan,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      idIngredient: json['idStamp'],
      name: json['name'],
      isAllergenic: json['isAllergenic'],
      isVegan: json['isVegan'],
    );
  }
}
