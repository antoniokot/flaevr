class NutritionalFactsRow {
  final int idNutrientNutritionalFacts;
  final String product;
  final String nutrient;
  final String value;
  final String dailyValue;

  NutritionalFactsRow(
      {this.idNutrientNutritionalFacts,
      this.product,
      this.nutrient,
      this.value,
      this.dailyValue});

  factory NutritionalFactsRow.fromJson(Map<String, dynamic> json) {
    return NutritionalFactsRow(
        idNutrientNutritionalFacts: json['idNutrientNutritionalFacts'],
        product: json['product'],
        nutrient: json['nutrient'],
        value: json['value'],
        dailyValue: json['dailyValue']);
  }
}
