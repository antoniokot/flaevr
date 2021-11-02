class NutrientNutritionalFacts {
  final int id;
  final int idNutrient;
  final int idNutrionalFacts;
  final String value;

  NutrientNutritionalFacts({
    required this.id,
    required this.idNutrient,
    required this.idNutrionalFacts,
    required this.value,
  });

  factory NutrientNutritionalFacts.fromJson(Map<String, dynamic> json) {
    return NutrientNutritionalFacts(
        id: json['idNutrientNutritionalFacts'],
        idNutrient: json['idNutrient'],
        idNutrionalFacts: json['idNutritionalFacts'],
        value: json['value']);
  }
}
