import 'NutritionalFactsRow.dart';

class NutritionalFacts {
  final int id;
  final int idProduct;
  final String serving;
  List<NutritionalFactsRow> nutrients;

  NutritionalFacts({this.id, this.idProduct, this.serving, this.nutrients});

  factory NutritionalFacts.fromJson(Map<String, dynamic> json) {
    return NutritionalFacts(
        id: json['idNutritionalFacts'],
        idProduct: json['idProduct'],
        serving: json['serving'],
        nutrients: json['nutrients']);
  }
}
