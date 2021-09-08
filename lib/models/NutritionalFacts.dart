class NutritionalFacts {
  final int id;
  final int idProduct;
  final String serving;

  NutritionalFacts({
    this.id,
    this.idProduct,
    this.serving,
  });

  factory NutritionalFacts.fromJson(Map<String, dynamic> json) {
    return NutritionalFacts(
      id: json['idNutritionalFacts'],  
      idProduct: json['idProduct'],
      serving: json['serving'],
    );
  }
}