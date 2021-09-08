class Ingredient {
  final int id;
  final String name;
  final int isAllergenic;
  final int isVegan;

  Ingredient({
    this.id,
    this.name,
    this.isAllergenic,
    this.isVegan,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['idStamp'],
      name: json['name'],
      isAllergenic: json['isAllergenic'],
      isVegan: json['isVegan'],
    );
  }
}
