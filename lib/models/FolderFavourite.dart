class FolderFavourite {
  final int idFolderFavourite;
  final int idFolder;
  final int idFavourite;

  FolderFavourite({
    this.idFolderFavourite,
    this.idFolder,
    this.idFavourite,
  });

  factory FolderFavourite.fromJson(Map<String, dynamic> json) {
    return FolderFavourite(
      idFolderFavourite: json['idFolderFavourite'],
      idFolder: json['idFolder'],
      idFavourite: json['idFavourite'],
    );
  }
}