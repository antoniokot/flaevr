class ProductIngredient {
  final int idProductIngredient;
  final int idProduct;
  final int idIngredient;

  ProductIngredient({
    this.idProductIngredient,
    this.idProduct,
    this.idIngredient,
  });

  factory ProductIngredient.fromJson(Map<String, dynamic> json) {
    return ProductIngredient(
      idProductIngredient: json['idProductIngredient'],
      idProduct: json['idProduct'],
      idIngredient: json['idIngredient'],
    );
  }
}
