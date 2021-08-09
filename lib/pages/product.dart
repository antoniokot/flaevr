import 'package:flaevr/components/sliverScaffold.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Product extends StatefulWidget {
  Product({Key key}) : super(key: key);

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> {
  var top = 0.0;
  var _mainColors;
  var textColor;

  @override
  void initState() {
    super.initState();
    getMainColors(
        new NetworkImage(
            "https://www.webpackaging.com/Up/Comp/1220/11116249/12336095-EFNGZGDX/i/prev/tetra-top-water.jpg"),
        new Size(1000, 200));
  }

  Future<void> getMainColors(NetworkImage img, Size size) async {
    await ColorGenerator.getMainColors(img, size, 4).then((value) => {
          _mainColors = value.colors.toList(),
          setState(() {
            adjustBrightness(_mainColors[0]);
          })
        });
  }

  void adjustBrightness(Color color) {
    textColor = ThemeData.estimateBrightnessForColor(color) == Brightness.light
        ? Color(0xFF3d3d4e)
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SliverScaffold(
      hasPinnedAppBar: true,
      expandedHeight: 200.0,
      borderRadius: 20.0,
      initialScrollOffset: 124.0,
      slivers: <Widget>[
        SliverAppBar(
            iconTheme: IconThemeData(color: textColor),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                ),
                tooltip: 'Add to favorites',
                onPressed: () {
                  // handle the press
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                ),
                tooltip: 'Share',
                onPressed: () {
                  // handle the press
                },
              ),
            ],
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            brightness: Brightness.light,
            backgroundColor: () {
              if (_mainColors == null)
                return Colors.blue;
              else
                return _mainColors[0];
            }(),
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: 1.0,
                      child: Padding(
                          padding: () {
                            if (top < 70) return EdgeInsets.only(bottom: 0);
                            if (top > 70 && top < 80)
                              return EdgeInsets.only(bottom: 9);
                            else
                              return EdgeInsets.only(bottom: 12);
                          }(),
                          child: Text(
                            "Nattier Chips",
                            style: TextStyle(fontSize: 14.0, color: textColor),
                          ))),
                  background: Image.network(
                    "https://www.webpackaging.com/Up/Comp/1220/11116249/12336095-EFNGZGDX/i/prev/tetra-top-water.jpg",
                    fit: BoxFit.cover,
                  ));
            })),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: <Widget>[
                Container(height: 1000, color: Colors.white),
              ],
            )
          ]),
        ),
      ],
    ));
  }
}
