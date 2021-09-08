class Folder {
  final int id;
  final String name;
  final int idUser;

  Folder({
    this.id,
    this.name,
    this.idUser,
  });

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      id: json['idFolder'],
      name: json['name'],
      idUser: json['idUser'],
    );
  }
}
