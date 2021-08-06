import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  Product({Key key}) : super(key: key);

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> {
  var top = 0.0;

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
              backgroundColor: Colors.pinkAccent,
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
                      "https://mir-s3-cdn-cf.behance.net/project_modules/1400/1f3fed76498107.5c6bdacdc92ec.jpg",
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
