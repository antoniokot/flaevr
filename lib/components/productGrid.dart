import 'package:flaevr/components/focusedMenu.dart';
import 'package:flaevr/components/popup.dart';
import 'package:flaevr/components/productCard.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Folder.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/pages/favorites.dart';
import 'package:flaevr/pages/product.dart';
import 'package:flaevr/services/FolderService.dart';
import 'package:flaevr/services/FolderProductService.dart';
import 'package:flaevr/utils/sessionManager.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/compareList.dart' as globalCompareList;
import 'dart:ui';

import 'modalHeader.dart';

class ProductGrid extends StatefulWidget {
  @override
  ProductGrid(
      {required this.physics, this.built = false, required this.products});
  final ScrollPhysics physics;
  final List<ProductModel> products;
  final bool built;
  @override
  ProductGridState createState() => ProductGridState();
}

class ProductGridState extends State<ProductGrid> {
  bool focused = false;
  int currentTapped = -1;

  int getGridCount(s) {
    if (s.width > 600 && s.width < 750)
      return 3;
    else if (s.width >= 750 && s.width < 1100)
      return 4;
    else if (s.width >= 1100)
      return 5;
    else
      return 2;
  }

  //var _tapPosition;

  // void _showCustomMenu(int index) {
  //   focused = true;
  //   final RenderBox overlay = Overlay.of(context).context.findRenderObject();
  //   setState(() {
  //     focused = true;
  //     currentTapped = index;
  //   });
  //   showMenu(
  //           context: context,
  //           items: <PopupMenuEntry<int>>[PopUpCustom()],
  //           position: RelativeRect.fromRect(
  //               _tapPosition &
  //                   const Size(40, 40), // smaller rect, the touch area
  //               Offset.zero & overlay.size // Bigger rect, the entire screen
  //               ))
  //       // This is how you handle user selection
  //       .then<void>((int op) {
  //     setState(() {
  //       focused = false;
  //       currentTapped = -1;
  //     });
  //     // delta would be null if user taps on outside the popup menu
  //     // (causing it to close without making selection)
  //     if (op == null) return;
  //   });

  //   // Another option:
  //   //
  //   // final delta = await showMenu(...);
  //   //
  //   // Then process `delta` however you want.
  //   // Remember to make the surrounding function `async`, that is:
  //   //
  //   // void _showCustomMenu() async { ... }
  // }

  // void _storePosition(TapDownDetails details) {
  //   _tapPosition = details.globalPosition;
  // }
  List<Folder>? userFolders;

  @override
  void initState() {
    getAllFolders();
    super.initState();
  }

  void getAllFolders() async {
    User user = new User();
    await FlutterSession().get("user").then((json) async {
      user = User.fromJson(json);
    });
    this.userFolders = await FolderService.getAllFoldersByIdUser(user.id!);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridView.builder(
        shrinkWrap: true,
        physics: this.widget.physics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getGridCount(size), childAspectRatio: 1 / 1.35),
        itemCount: this.widget.built ? this.widget.products.length : 4,
        itemBuilder: (BuildContext context, int index) {
          if (this.widget.built)
            return FocusedMenuHolder(
                menuWidth: MediaQuery.of(context).size.width * 0.50,
                blurSize: 0.5,
                menuItemExtent: 35,
                menuBoxDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.23),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                duration: Duration(milliseconds: 100),
                animateMenuItems: true,
                blurBackgroundColor: Colors.white,
                openWithTap:
                    false, // Open Focused-Menu on Tap rather than Long Press
                menuOffset:
                    0.0, // Offset value to show menuItem from the selected item
                bottomOffsetHeight:
                    60.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                menuItems: <FocusedMenuItem>[
                  // Add Each FocusedMenuItem  for Menu Options
                  FocusedMenuItem(
                      title: Text("Salvar"),
                      trailingIcon: Icon(Icons.bookmark_border),
                      onPressed: () {
                        showModalBottomSheet<void>(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 19),
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                height:
                                    MediaQuery.of(context).size.height - 100,
                                child: Column(children: [
                                  ModalHeader(
                                      title: "Selecione uma pasta",
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12)),
                                  Favorites(
                                    built: true,
                                    folders: userFolders ?? [],
                                    runDefault: false,
                                    onClick: (v) {
                                      FolderProductService.postNewFolderProduct(
                                          v,
                                          this.widget.products[index].id
                                              as int);
                                      Navigator.pop(context);
                                    },
                                  )
                                ]),
                              );
                            });
                      }),
                  FocusedMenuItem(
                      title: Text("Comparar"),
                      trailingIcon: () {
                        for (int i = 0;
                            i < globalCompareList.list.length;
                            i++) {
                          if (globalCompareList.list[i].id ==
                              this.widget.products[index].id)
                            return Icon(Icons.remove);
                        }
                        return Icon(Icons.compare_arrows_outlined);
                      }(),
                      onPressed: () {
                        for (int i = 0;
                            i < globalCompareList.list.length;
                            i++) {
                          if (globalCompareList.list[i].id ==
                              this.widget.products[index].id) {
                            globalCompareList.list
                                .remove(this.widget.products[index]);
                            return;
                          }
                        }
                        globalCompareList.list.add(this.widget.products[index]);
                      }),
                  FocusedMenuItem(
                      title: Text("Compartilhar"),
                      trailingIcon: Icon(Icons.share),
                      onPressed: () {}),
                ],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Product(prod: this.widget.products[index])));
                },
                child: ProductCard(
                  product: this.widget.products[index],
                  heightAspectRatio: new AspectRatio(aspectRatio: 2.3),
                  width: 190,
                ));
          else
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Skeleton(
                  width: 190,
                  height: 190 * 2.3,
                  padding: EdgeInsets.symmetric(horizontal: 10.0)),
            );
        });
  }
}

// GestureDetector(
//                     // This does not give the tap position ...
//                     onLongPress: () => _showCustomMenu(index),
//                     // Have to remember it on tap-down.
//                     onTapDown: _storePosition,
//                     onTap: () => {
//                           
//                           // Add Your Code here.
//                         },
//                     child: 