import 'package:flaevr/components/modalHeader.dart';
import 'package:flaevr/components/notFound.dart';
import 'package:flaevr/components/product/productCard.dart';
import 'package:flaevr/components/profilePicturePicker.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/pages/favorites.dart';
import 'package:flaevr/pages/config.dart';
import 'package:flaevr/pages/product.dart';
import 'package:flaevr/services/FolderService.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flaevr/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/sessionManager.dart';
import 'dart:async';

import 'package:palette_generator/palette_generator.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool isVisible = true;
  bool isOpaque = true;
  double _borderRadius = 20.0;
  final _newFolderName = TextEditingController();

  _onUpdateScroll(ScrollMetrics metrics) {
    if (metrics.pixels > -1 && metrics.pixels < 20) {
      setState(() {
        _borderRadius = 20 - metrics.pixels;
      });
    }
  }

  Future<List<ProductModel>?>? recents;
  Future<List<Folder>?>? allFolders;
  User? user;
  Color? userColor;
  bool isRecentsEmpty = false;
  bool isFavoritesEmpty = false;

  void getUser() async {
    await FlutterSession().get("user").then((json) async {
      this.user = User.fromJson(json);
      this.allFolders =
          FolderService.getAllFoldersByIdUser(this.user!.id!).then((value) {
        if (value == null || value.length <= 0) {
          this.isFavoritesEmpty = true;
          setState(() {});
        }
        return value;
      });
      this.recents =
          ProductService.getAllRecentProducts(this.user!.id!).then((value) {
        if (value == null || value.length <= 0) {
          this.isRecentsEmpty = true;
          setState(() {});
        }
        return value;
      });
      setState(() {});
      ImageProvider imgToGet;
      if (this.user!.avatar != null) {
        if (Utility.isNumeric(this.user!.avatar!))
          imgToGet = new AssetImage(
              "lib/assets/images/avatars/prof" + this.user!.avatar! + ".png");
        else
          imgToGet = new NetworkImage(this.user!.avatar!);
      } else
        imgToGet = new AssetImage("lib/assets/images/avatars/prof1.png");

      PaletteGenerator color =
          await ColorGenerator.getMainColors(imgToGet, new Size(100, 100), 3);

      this.userColor = ColorGenerator.getColorByImportance(color)!.color;
      setState(() {});
    });
  }

  Future<void> refresh() async {
    this.isRecentsEmpty = false;
    this.isFavoritesEmpty = false;
    setState(() {
      getUser();
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor:
              this.userColor == null ? Styles.mutedGrey : this.userColor!,
          body: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 60),
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 60),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_borderRadius),
                        topRight: Radius.circular(_borderRadius)),
                  ),
                  child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification) {
                          _onUpdateScroll(scrollNotification.metrics);
                        }
                        return false;
                      },
                      child: RefreshIndicator(
                          color: Color(0xFFFF4646),
                          onRefresh: () => refresh(),
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.only(left: 19),
                                  child: Text(
                                    "Recentes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xFF3D3D4E)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7),
                                  child: SizedBox(
                                    height: 220,
                                    child: FutureBuilder<List<ProductModel>?>(
                                      future: recents,
                                      builder: (context, snapshot) {
                                        if (isRecentsEmpty) {
                                          return NotFound(
                                            text: "Que vazio!",
                                          );
                                        }
                                        if (snapshot.hasData) {
                                          if (snapshot.data == null ||
                                              snapshot.data?.length == 0)
                                            return NotFound(
                                              text: "Que vazio!",
                                            );
                                          else {
                                            return ListView.builder(
                                                controller: ScrollController(),
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    snapshot.data!.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                            int index) =>
                                                        InkWell(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => Product(
                                                                      prod: snapshot
                                                                              .data![
                                                                          index]))),
                                                          child: ProductCard(
                                                            heightAspectRatio:
                                                                new AspectRatio(
                                                                    aspectRatio:
                                                                        1.4),
                                                            width: 140,
                                                            product: snapshot
                                                                .data![index],
                                                          ),
                                                        ));
                                          }
                                        } else if (snapshot.hasError) {
                                          return NotFound(text: "Que vazio!");
                                        }
                                        // By default, show a loading skeleton.
                                        return ListView.builder(
                                            controller: ScrollController(),
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 15,
                                            itemBuilder: (BuildContext context,
                                                    int index) =>
                                                Skeleton(
                                                  width: 140,
                                                  height: 240,
                                                  padding: EdgeInsets.all(12),
                                                  radius: 16,
                                                ));
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 15, left: 19, top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Favoritos",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xFF3D3D4E))),
                                      Padding(
                                        padding: EdgeInsets.only(right: 19),
                                        child: InkWell(
                                          customBorder: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Styles.lightMutedGrey,
                                                borderRadius:
                                                    BorderRadius.circular(18)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 15.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Nova Pasta",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.add,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          onTap: () => {
                                            showModalBottomSheet<void>(
                                                isScrollControlled: true,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 19),
                                                    decoration: new BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height -
                                                            100,
                                                    child: Column(children: [
                                                      ModalHeader(
                                                        title:
                                                            "Criar uma pasta",
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 12),
                                                        actions: [
                                                          InkWell(
                                                              onTap: () => {
                                                                    FolderService.postNewFolder(
                                                                            _newFolderName.text.isEmpty
                                                                                ? "Nova Pasta"
                                                                                : _newFolderName
                                                                                    .text,
                                                                            this
                                                                                .user!
                                                                                .id!)
                                                                        .then((value) =>
                                                                            Navigator.pop(context))
                                                                  },
                                                              child: Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        8.0,
                                                                    horizontal:
                                                                        15.0),
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        0xFFFF4646),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18)),
                                                                child: Text(
                                                                  "Criar",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 12,
                                                                    top: 12),
                                                            child: Text(
                                                              "Nome da Pasta",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF3d3d4e),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14),
                                                            ),
                                                          ),
                                                          TextField(
                                                            controller:
                                                                _newFolderName,
                                                            autofocus: false,
                                                            style: TextStyle(
                                                                fontSize: 15.0,
                                                                color: Color(
                                                                    0xFF3d3d4e)),
                                                            decoration:
                                                                InputDecoration(
                                                                    filled:
                                                                        true,
                                                                    fillColor: Color
                                                                        .fromRGBO(
                                                                            241,
                                                                            241,
                                                                            242,
                                                                            1),
                                                                    contentPadding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            14.0,
                                                                        bottom:
                                                                            8.0,
                                                                        top:
                                                                            8.0),
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .all(
                                                                        const Radius.circular(
                                                                            8.0),
                                                                      ),
                                                                      borderSide:
                                                                          BorderSide(
                                                                        width:
                                                                            0,
                                                                        style: BorderStyle
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors.grey),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    )),
                                                          )
                                                        ],
                                                      )
                                                    ]),
                                                  );
                                                }).then((value) => {refresh()})
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: Styles.sidePadding
                                      .add(EdgeInsets.only(bottom: 60)),
                                  child: FutureBuilder<List<Folder>?>(
                                    future: allFolders,
                                    builder: (context, snapshot) {
                                      if (isFavoritesEmpty) {
                                        return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            child: NotFound(
                                              text: "Que vazio!",
                                            ));
                                      }
                                      if (snapshot.hasData) {
                                        return Favorites(
                                          built: true,
                                          folders: snapshot.data!,
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }
                                      return Favorites(
                                        built: false,
                                        folders: [],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )))),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: size.width,
                    color: this.userColor == null
                        ? Styles.mutedGrey
                        : this.userColor,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 19),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            this._borderRadius),
                                      ),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          decoration: new BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          this._borderRadius))),
                                          height: 400,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 20),
                                                    child: Text(
                                                        'Mudar a foto de perfil',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                          color:
                                                              Color(0xFF3D3D4E),
                                                        ))),
                                                ProfilePicturePicker(
                                                    id: this.user!.id!)
                                              ],
                                            ),
                                          ),
                                        );
                                      }).then((value) => {
                                        setState(() {
                                          getUser();
                                        })
                                      });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: this.user != null
                                            ? this.user!.avatar == null
                                                ? AssetImage(
                                                    "lib/assets/images/avatars/prof1.png")
                                                : Utility.isNumeric(this
                                                            .user!
                                                            .avatar) ==
                                                        false
                                                    ? NetworkImage(
                                                        this.user!.avatar!)
                                                    : AssetImage(
                                                            "lib/assets/images/avatars/prof" +
                                                                this.user!.avatar! +
                                                                ".png")
                                                        as ImageProvider
                                            : AssetImage(
                                                "lib/assets/images/avatars/prof1.png"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Text(this.user == null ? " " : this.user!.name!),
                              IconButton(
                                  icon: Icon(Icons.settings),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Config()));
                                  })
                            ]))),
              ),
            ],
          )),
    );
  }
}
