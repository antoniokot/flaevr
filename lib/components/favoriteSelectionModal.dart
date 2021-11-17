import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/pages/favorites.dart';
import 'package:flaevr/services/FolderProductService.dart';
import 'package:flaevr/services/FolderService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

import 'modalHeader.dart';

class FavoriteSelectionModal extends StatefulWidget {
  const FavoriteSelectionModal(
      {Key? key, required this.idUser, required this.idProduct})
      : super(key: key);

  final int idUser;
  final int idProduct;

  @override
  _FavoriteSelectionModalState createState() => _FavoriteSelectionModalState();
}

class _FavoriteSelectionModalState extends State<FavoriteSelectionModal> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Styles.sidePadding,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      height: MediaQuery.of(context).size.height - 100,
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            ModalHeader(
                title: "Selecione uma pasta",
                padding: EdgeInsets.symmetric(vertical: 12)),
            FutureBuilder<List<Folder>?>(
              future: FolderService.getAllFoldersByIdUser(widget.idUser),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Favorites(
                    runDefault: false,
                    built: true,
                    folders: snapshot.data!,
                    onClick: (v) {
                      FolderProductService.postNewFolderProduct(
                          v, this.widget.idProduct);
                      Navigator.pop(context);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return Favorites(built: false, folders: []);
              },
            )
          ])),
    );
  }
}
