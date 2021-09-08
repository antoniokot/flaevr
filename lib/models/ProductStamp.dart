class ProductStamp {
  final int id;
  final int idProduct;
  final int idStamp;

  ProductStamp({
    this.id,
    this.idProduct,
    this.idStamp,
  });

  factory ProductStamp.fromJson(Map<String, dynamic> json) {
    return ProductStamp(
      id: json['idProductStamp'],
      idProduct: json['idProduct'],
      idStamp: json['idStamp'],
    );
  }
}
