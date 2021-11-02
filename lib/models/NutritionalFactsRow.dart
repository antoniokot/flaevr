class NutritionalFactsRow {
  final int idNutrientNutritionalFacts;
  final String product;
  final String nutrient;
  final String value;
  final String dailyValue;

  NutritionalFactsRow(
      {required this.idNutrientNutritionalFacts,
      required this.product,
      required this.nutrient,
      required this.value,
      required this.dailyValue});

  factory NutritionalFactsRow.fromJson(Map<String, dynamic> json) {
    return NutritionalFactsRow(
        idNutrientNutritionalFacts: json['idNutrientNutritionalFacts'],
        product: json['product'],
        nutrient: json['nutrient'],
        value: json['value'],
        dailyValue: json['dailyValue']);
  }
}
