class ProductModel {
  final int id;
  final String name;
  final String barcode;

  ProductModel({
    this.id,
    this.name,
    this.barcode,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['idProduct'],
      name: json['name'],
      barcode: json['barcode'],
    );
  }
}
