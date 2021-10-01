class Folder {
  final int id;
  final String name;
  final int idUser;
  final List<String> photos;

  Folder({
    this.id,
    this.name,
    this.idUser,
    this.photos
  });

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      id: json['idFolder'],
      name: json['name'],
      idUser: json['idUser'],
    );
  }
}
