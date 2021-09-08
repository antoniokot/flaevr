import 'dart:convert';

import 'package:flaevr/components/productComposition.dart';
import 'package:flaevr/components/productOverview.dart';
import 'package:flaevr/components/sliverScaffold.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Product extends StatefulWidget {
  Product({Key key, this.barcode}) : super(key: key);

  String barcode;

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> with SingleTickerProviderStateMixin {
  var top = 0.0;
  var _mainColors;
  var textColor;
  final List<Widget> myTabs = [
    Tab(text: 'Resumo'),
    Tab(text: 'Composição'),
    Tab(text: 'Sustentabilidade'),
  ];
  TabController _tabController;

  @override
  void initState() {
    if (widget.barcode != "" && widget.barcode != null) fetchByBarcode();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    getMainColors(
        new NetworkImage(
            "https://www.webpackaging.com/Up/Comp/1220/11116249/12336095-EFNGZGDX/i/prev/tetra-top-water.jpg"),
        new Size(1000, 200));
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<ProductModel> fetchByBarcode() async {
    final response = await http.get(Uri.parse('api link'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
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

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 2,
            child: SliverScaffold(
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
                          color: Color(0xFF3d3d4e),
                        ),
                        tooltip: 'Add to favorites',
                        onPressed: () {
                          // handle the press
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Color(0xFF3d3d4e),
                        ),
                        tooltip: 'Share',
                        onPressed: () {
                          // handle the press
                        },
                      ),
                    ],
                    bottom: PreferredSize(
                        preferredSize:
                            const Size(double.infinity, kToolbarHeight),
                        child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: TabBar(
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Color(0xFFFF4646),
                              controller: _tabController,
                              labelColor: Color(0xFFFF4646),
                              tabs: myTabs,
                            ))),
                    expandedHeight: 200.0,
                    elevation: 0,
                    floating: false,
                    pinned: true,
                    brightness: Brightness.light,
                    backgroundColor: () {
                      if (_mainColors == null)
                        return Colors.blue;
                      else
                        return _mainColors[0];
                    }(),
                    flexibleSpace: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                          centerTitle: true,
                          title: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: 1.0,
                              child: Padding(
                                  padding: () {
                                    if (top < 120)
                                      return EdgeInsets.only(bottom: 45);
                                    if (top >= 120 && top <= 160)
                                      return EdgeInsets.only(bottom: 35);
                                    else
                                      return EdgeInsets.only(bottom: 25);
                                  }(),
                                  child: Text(
                                    "Nattier Chips",
                                    style: TextStyle(
                                        fontSize: 14.0, color: textColor),
                                  ))),
                          background: Image.network(
                            "https://www.webpackaging.com/Up/Comp/1220/11116249/12336095-EFNGZGDX/i/prev/tetra-top-water.jpg",
                            fit: BoxFit.cover,
                          ));
                    })),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: [
                          ProductOverview.withSampleData(),
                          ProductComposition(),
                          Column(
                            children: [
                              Text('third tab'),
                              ...List.generate(
                                  40, (index) => Text('line: $index'))
                            ],
                          ),
                        ][_tabController.index],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
