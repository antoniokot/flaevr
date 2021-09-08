class Scanned {
  final int id;
  final int idUser;
  final int idProduct;

  Scanned({
    this.id,
    this.idUser,
    this.idProduct
  });

  factory Scanned.fromJson(Map<String, dynamic> json) {
    return Scanned(
      id: json['idScanned'],  
      idUser: json['idUser'],
      idProduct: json['idProduct']
    );
  }
}
