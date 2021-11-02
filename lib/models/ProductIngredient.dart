class ProductIngredient {
  final int id;
  final int idProduct;
  final int idIngredient;

  ProductIngredient({
    required this.id,
    required this.idProduct,
    required this.idIngredient,
  });

  factory ProductIngredient.fromJson(Map<String, dynamic> json) {
    return ProductIngredient(
      id: json['idProductIngredient'],
      idProduct: json['idProduct'],
      idIngredient: json['idIngredient'],
    );
  }
}
