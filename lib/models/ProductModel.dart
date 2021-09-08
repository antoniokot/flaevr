class ProductModel {
  final int id;
  final String name;

  ProductModel({
    this.id,
    this.name,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
