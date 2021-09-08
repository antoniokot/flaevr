class Folder {
  final int id;
  final int idFav;

  Folder({
    this.id,
    this.idFav,
  });

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      id: json['idFolder'],
      idFav: json['idFavourite'],
    );
  }
}
