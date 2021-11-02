import 'NutritionalFactsRow.dart';

class NutritionalFacts {
  final int id;
  final int idProduct;
  final String serving;
  List<NutritionalFactsRow> nutrients;

  NutritionalFacts(
      {required this.id,
      required this.idProduct,
      required this.serving,
      required this.nutrients});

  factory NutritionalFacts.fromJson(Map<String, dynamic> json) {
    return NutritionalFacts(
        id: json['idNutritionalFacts'],
        idProduct: json['idProduct'],
        serving: json['serving'],
        nutrients: json['nutrients']);
  }
}
