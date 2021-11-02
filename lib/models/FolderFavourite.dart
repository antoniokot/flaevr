class FolderFavourite {
  final int id;
  final int idFolder;
  final int idFavourite;

  FolderFavourite({
    required this.id,
    required this.idFolder,
    required this.idFavourite,
  });

  factory FolderFavourite.fromJson(Map<String, dynamic> json) {
    return FolderFavourite(
      id: json['idFolderFavourite'],
      idFolder: json['idFolder'],
      idFavourite: json['idFavourite'],
    );
  }
}
