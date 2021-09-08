class Folder {
  final int idFolder;
  final String name;
  final int idUser;

  Folder({
    this.idFolder,
    this.name,
    this.idUser,
  });

  factory Folder.fromJson(Map<String, dynamic> json) {
    return Folder(
      idFolder: json['idFolder'],
      name: json['name'],
      idUser: json['idUser'],
    );
  }
}
