import 'package:flaevr/models/ProductModel.dart';

class Favourite {
  final int idFavourite;
  final int idProduct;

  Favourite({
    this.idFavourite,
    this.idProduct,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      idFavourite: json['idFavourite'],
      idProduct: json['idProduct'],
    );
  }
}
