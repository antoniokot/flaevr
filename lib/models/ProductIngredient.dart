class ProductIngredient {
  final int id;
  final int idProduct;
  final int idIngredient;

  ProductIngredient({
    this.id,
    this.idProduct,
    this.idIngredient,
  });

  factory ProductIngredient.fromJson(Map<String, dynamic> json) {
    return ProductIngredient(
      id: json['idProductIngredient'],
      idProduct: json['idProduct'],
      idIngredient: json['idIngredient'],
    );
  }
}
