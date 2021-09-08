import 'package:flaevr/models/ProductModel.dart';

class Favourite {
  final int id;
  final ProductModel product;

  Favourite({
    this.id,
    this.product,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: json['idFavourite'],
      product: ProductModel.fromJson(json['product']),
    );
  }
}
