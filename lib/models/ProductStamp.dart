class ProductStamp {
  final int id;
  final int idProduct;
  final int idStamp;

  ProductStamp({
    required this.id,
    required this.idProduct,
    required this.idStamp,
  });

  factory ProductStamp.fromJson(Map<String, dynamic> json) {
    return ProductStamp(
      id: json['idProductStamp'],
      idProduct: json['idProduct'],
      idStamp: json['idStamp'],
    );
  }
}
