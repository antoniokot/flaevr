import 'package:flaevr/components/focusedMenu.dart';
import 'package:flaevr/components/popup.dart';
import 'package:flaevr/components/productCard.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/pages/product.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

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

  var _tapPosition;

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

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
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
                menuWidth: MediaQuery.of(context).size.width * 0.40,
                blurSize: 5.0,
                menuItemExtent: 35,
                menuBoxDecoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
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
                      title: Text("Open"),
                      trailingIcon: Icon(Icons.open_in_new),
                      onPressed: () {}),
                  FocusedMenuItem(
                      title: Text("Share"),
                      trailingIcon: Icon(Icons.share),
                      onPressed: () {}),
                  FocusedMenuItem(
                      title: Text("Favorite"),
                      trailingIcon: Icon(Icons.favorite_border),
                      onPressed: () {}),
                  FocusedMenuItem(
                      title: Text(
                        "Delete",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      trailingIcon: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
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
            return Skeleton(
                width: 190,
                height: 190 * 2.3,
                padding: EdgeInsets.symmetric(horizontal: 10.0));
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