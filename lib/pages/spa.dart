import 'dart:async';

import 'package:flaevr/pages/home.dart';
import 'package:flaevr/pages/product.dart';
import 'package:flaevr/pages/main_page.dart';
import 'package:flaevr/pages/products.dart';
import 'package:flaevr/pages/profile.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flaevr/pages/search.dart';
import 'package:flaevr/pages/favorites.dart';
import 'package:flaevr/pages/results.dart';
import 'package:flutter/material.dart';

class Origin extends StatefulWidget {
  Origin({Key key}) : super(key: key);

  @override
  OriginState createState() => OriginState();
}

class OriginState extends State<Origin> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Search(),
    Product(),
    Favorites(built: true),
    Profile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff4646', 'Cancelar', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted)
      return;
    else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Product(barcode: barcodeScanRes)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 15),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () => scanBarcodeNormal(),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFFF4646)),
              child: Icon(Icons.camera_alt_outlined, size: 32),
            ),
          ),
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
        _children[_currentIndex],
        Positioned(
            width: () {
              if (MediaQuery.of(context).size.width < 500)
                return MediaQuery.of(context).size.width - 60;
              else
                return 400.0;
            }(),
            bottom: 20.0,
            child: new Container(
                height: 50.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.23),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(icon: () {
                      if (_currentIndex != 0)
                        return Icon(
                          Icons.home,
                          color: Color(0xFFAEAEB2),
                        );
                      else
                        return Icon(
                          Icons.home,
                          color: Color(0xFF3d3d4e),
                        );
                    }(), onPressed: () {
                      onTabTapped(0);
                    }),
                    IconButton(icon: () {
                      if (_currentIndex != 1)
                        return Icon(
                          Icons.search,
                          color: Color(0xFFAEAEB2),
                        );
                      else
                        return Icon(
                          Icons.search,
                          color: Color(0xFF3d3d4e),
                        );
                    }(), onPressed: () {
                      onTabTapped(1);
                    }),
                    IconButton(
                        icon: Icon(
                          Icons.home,
                          color: Color(0xFF3d3d4e),
                        ),
                        onPressed: () {}),
                    IconButton(icon: () {
                      if (_currentIndex != 3)
                        return Icon(
                          Icons.favorite,
                          color: Color(0xFFAEAEB2),
                        );
                      else
                        return Icon(
                          Icons.favorite,
                          color: Color(0xFF3d3d4e),
                        );
                    }(), onPressed: () {
                      onTabTapped(3);
                    }),
                    IconButton(icon: () {
                      if (_currentIndex != 4)
                        return Icon(
                          Icons.person,
                          color: Color(0xFFAEAEB2),
                        );
                      else
                        return Icon(
                          Icons.person,
                          color: Color(0xFF3d3d4e),
                        );
                    }(), onPressed: () {
                      onTabTapped(4);
                    }),
                  ],
                )))
      ]),
    );
  }
}
