class ProductStamp {
  final int idProductStamp;
  final int idProduct;
  final int idStamp;

  ProductStamp({
    this.idProductStamp,
    this.idProduct,
    this.idStamp,
  });

  factory ProductStamp.fromJson(Map<String, dynamic> json) {
    return ProductStamp(
      idProductStamp: json['idProductStamp'],
      idProduct: json['idProduct'],
      idStamp: json['idStamp'],
    );
  }
}
