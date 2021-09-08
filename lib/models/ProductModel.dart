class ProductModel {
  final int idProduct;
  final String name;
  final String barcode;

  ProductModel({
    this.idProduct,
    this.name,
    this.barcode,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      idProduct: json['idProduct'],
      name: json['name'],
      barcode: json['barcode'],
    );
  }
}
