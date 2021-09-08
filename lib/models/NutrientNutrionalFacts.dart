class NutrientNutritionalFacts {
  final int id;
  final int idNutrient;
  final int idNutrionalFacts;
  final String value;

   NutrientNutritionalFacts({
    this.id,
    this.idNutrient,
    this.idNutrionalFacts,
    this.value,
  });

  factory NutrientNutritionalFacts.fromJson(Map<String, dynamic> json) {
    return NutrientNutritionalFacts(
      id: json['idNutrientNutritionalFacts'],  
      idNutrient: json['idNutrient'],
      idNutrionalFacts: json['idNutritionalFacts'],
      value: json['value']
    );
  }
}