class ProductModel {
  final int id;
  final String name;
  final String barcode;
  final String pictureUrl;

  ProductModel({
    this.id,
    this.name,
    this.barcode,
    this.pictureUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['idProduct'],
        name: json['name'],
        barcode: json['barcode'],
        pictureUrl: json['pictureUrl']);
  }
}
