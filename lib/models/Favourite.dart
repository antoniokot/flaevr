import 'package:flaevr/models/ProductModel.dart';

class Favourite {
  final int id;
  final int idProduct;

  Favourite({
    this.id,
    this.idProduct,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: json['idFavourite'],
      idProduct: json['idProduct'],
    );
  }
}
