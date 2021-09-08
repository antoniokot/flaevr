class FolderFavourite {
  final int id;
  final int idFolder;
  final int idFavourite;

  FolderFavourite({
    this.id,
    this.idFolder,
    this.idFavourite,
  });

  factory FolderFavourite.fromJson(Map<String, dynamic> json) {
    return FolderFavourite(
      id: json['idFolderFavourite'],
      idFolder: json['idFolder'],
      idFavourite: json['idFavourite'],
    );
  }
}