import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/pages/favorites_folder_page.dart';

class FavFolder extends StatefulWidget {
  const FavFolder(
      {Key? key,
      required this.folder,
      required this.onClick,
      this.runDefault = true})
      : super(key: key);

  final Folder folder;
  final Function onClick;
  final bool runDefault;

  @override
  FavFolderState createState() => FavFolderState();
}

class FavFolderState extends State<FavFolder> {
  int? numberOfItems;
  List<ProductModel>? products;
  List<dynamic>? colors;
  int? len;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void getProducts() async {
    this.products =
        await ProductService.getAllProductsInFolder(this.widget.folder.id);
    this.numberOfItems = products != null ? products!.length : 0;
    this.len = this.numberOfItems! > 3 ? 3 : this.numberOfItems;
    for (int i = 0; i < this.len!; i++) {
      getMainColors(
          new NetworkImage(products![i].pictureUrl != null
              ? products![i].pictureUrl.toString()
              : "https://media.istockphoto.com/photos/doing-business-with-a-smile-picture-id1330547068?s=612x612"),
          new Size(500, 500),
          i);
    }

    setState(() {});
  }

  Future<void> getMainColors(ImageProvider img, Size size, int index) async {
    await ColorGenerator.getMainColors(img, size, 4).then((value) => {
          colors![index] = ColorGenerator.getColorByImportance(value)?.color,
          if (mounted) setState(() {})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
        child: InkResponse(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding:
                              (numberOfItems != null ? numberOfItems! : 0) >= 2
                                  ? const EdgeInsets.only(right: 3.0)
                                  : EdgeInsets.all(0),
                          child: Container(
                              height: MediaQuery.of(context).size.width /
                                  3.189, // só aceita q eh esse numero
                              decoration: BoxDecoration(
                                color: (this.colors != null
                                    ? this.colors![0]
                                    : Styles.lightMutedGrey),
                                borderRadius: BorderRadius.only(
                                    topRight: (numberOfItems != null
                                                ? numberOfItems!
                                                : 0) <
                                            2
                                        ? Radius.circular(18.0)
                                        : Radius.circular(0),
                                    topLeft: Radius.circular(18.0),
                                    bottomRight: (numberOfItems != null
                                                ? numberOfItems!
                                                : 0) <
                                            2
                                        ? Radius.circular(18.0)
                                        : Radius.circular(0),
                                    bottomLeft: Radius.circular(18.0)),
                              ),
                              child: Padding(
                                  padding: (numberOfItems != null
                                              ? numberOfItems!
                                              : 0) >
                                          1
                                      ? const EdgeInsets.all(8.0)
                                      : EdgeInsets.only(
                                          left: 28,
                                          right: 28,
                                          bottom: 8,
                                          top: 8),
                                  child: () {
                                    if (this.products!.isNotEmpty)
                                      return this.products![0].pictureUrl !=
                                              null
                                          ? Image.network(
                                              this.products![0].pictureUrl!)
                                          : Container();
                                    else
                                      return Container();
                                  }())),
                        )),
                    Expanded(
                      flex: (numberOfItems != null ? numberOfItems! : 0) < 2
                          ? 0
                          : 1,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              flex: (numberOfItems != null ? numberOfItems! : 0) >= 2 ? 1 : 0,
                              child: Padding(
                                padding: (numberOfItems != null ? numberOfItems! : 0) >= 3
                                    ? const EdgeInsets.only(bottom: 3.0)
                                    : EdgeInsets.all(0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (this.colors != null
                                      ? this.colors![1]
                                      : Styles.lightMutedGrey
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(18.0),
                                      topLeft: Radius.circular(0),
                                      bottomRight: (numberOfItems != null ? numberOfItems! : 0) < 3
                                        ? Radius.circular(18.0)
                                        : Radius.circular(0),
                                      bottomLeft: Radius.circular(0)
                                    ),
                                  ),
                                  child: (numberOfItems != null ? numberOfItems! : 0) >= 2
                                    ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: () {
                                        if (this.products != null)
                                        return this.products![1].pictureUrl != null
                                          ? Image.network(this.products![1].pictureUrl!)
                                          : Container();
                                        else
                                          return Container();
                                      }()
                                    )
                                    : null
                                ),
                              )
                          ),
                          Expanded(
                              flex: (numberOfItems != null ? numberOfItems! : 0) == 3 ? 1 : 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: (this.colors != null
                                        ? this.colors![2]
                                        : Styles.lightMutedGrey),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(18.0)),
                                  ),
                                  child: (numberOfItems != null
                                              ? numberOfItems!
                                              : 0) >=
                                          3
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: () {
                                            if (this.products != null)
                                              return this
                                                          .products![2]
                                                          .pictureUrl !=
                                                      null
                                                  ? Image.network(this
                                                      .products![2]
                                                      .pictureUrl!)
                                                  : Container();
                                            else
                                              return Container();
                                          }())
                                      : null)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  this.widget.folder.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                      color: Color(0xFF3D3D4E)),
                ),
              ),
            ],
          ),
          onTap: () => {
            if (this.widget.runDefault == false)
              this.widget.onClick(this.widget.folder.id)
            else
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FolderPage(folder: this.widget.folder)))
              }
          },
        ),
      ),
    );
  }
}
