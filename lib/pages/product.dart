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

  @override
  void initState() {
    super.initState();
    getMainColors(
        new NetworkImage(
            "https://images.pexels.com/photos/7319324/pexels-photo-7319324.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
        new Size(1000, 200));
  }

  Future<void> getMainColors(NetworkImage img, Size size) async {
    await ColorGenerator.getMainColors(img, size, 4).then(
        (value) => {_mainColors = value.colors.toList(), setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      controller: new ScrollController(initialScrollOffset: (200.0 - 76.0)),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.favorite),
                  tooltip: 'Open shopping cart',
                  onPressed: () {
                    // handle the press
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  tooltip: 'Open shopping cart',
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
                        child: Text(
                          "Nattier Chips",
                          style: TextStyle(fontSize: 14.0),
                        )),
                    background: Image.network(
                      "https://images.pexels.com/photos/7319324/pexels-photo-7319324.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                      fit: BoxFit.cover,
                    ));
              })),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.amber,
            ),
            Container(
              height: 100,
              color: Colors.purple,
            ),
            Container(
              height: 100,
              color: Colors.amber,
            ),
            Container(
              height: 100,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    ));
  }
}
