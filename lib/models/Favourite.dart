class Favourite {
  final int id;
  final int idProduct;

  Favourite({
    required this.id,
    required this.idProduct,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return Favourite(
      id: json['idFavourite'],
      idProduct: json['idProduct'],
    );
  }
}
