import 'package:flaevr/components/productComposition.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Composition.dart';
import 'package:flaevr/models/Ingredient.dart';
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/services/IngredientService.dart';
import 'package:flaevr/services/NutritionalService.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/components/productOverview.dart';
import 'package:flaevr/components/sliverScaffold.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Product extends StatefulWidget {
  Product({Key key, this.barcode, this.prod}) : super(key: key);

  final String barcode;
  final ProductModel prod;

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> with SingleTickerProviderStateMixin {
  //will be fetched on initState
  Future<ProductModel> product;
  Future<Composition> composition;

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
    super.initState();
    if (widget.barcode != "" && widget.barcode != null) {
      print("tem barcode");
      this.product =
          ProductService.getByBarcode(widget.barcode).then((ProductModel p) {
        fetchAll(p.id);
        return p;
      });
    } else if (widget.prod != null && widget.prod.id > 0) {
      print("nn tem barcode");
      this.product = getProductAsync();
      fetchAll(this.widget.prod.id);
    } else {
      print("deu erroooo");
    }

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    getMainColors(
        new NetworkImage(
            "https://www.webpackaging.com/Up/Comp/1220/11116249/12336095-EFNGZGDX/i/prev/tetra-top-water.jpg"),
        new Size(1000, 200));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //talvez retorne um dicionario
  Future<void> fetchAll(int id) async {
    if (this.product == null) this.product = ProductService.getByID(id);

    this.composition = fetchComposition(id);
    //fetch tabela nutricional, meio ambiente e selos
  }

  Future<ProductModel> getProductAsync() async {
    return this.widget.prod;
  }

  Future<Composition> fetchComposition(int id) async {
    var c = new Composition(
        //nutritionalFacts: await NutriotinalService.getByID(id),
        nutritionalFacts: new NutritionalFacts(
            id: 1, idProduct: 1, serving: "malygnos", nutrients: []),
        ingredients: await IngredientService.getByID(id));

    setState(() {});

    return c;
  }

  Future<void> getMainColors(NetworkImage img, Size size) async {
    await ColorGenerator.getMainColors(img, size, 4).then((value) => {
          _mainColors = value.colors.toList(),
          /*for (int i = 0; i < value.colors.toList().length; i++)
            {
              print("ai malygnos: " + value.colors.toList()[i].value.toString())
            },*/
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
                                  child: FutureBuilder<ProductModel>(
                                    future: product,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data.name,
                                          style: TextStyle(
                                              fontSize: 14.0, color: textColor),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }
                                      return Skeleton(
                                        width: 60,
                                        height: 18,
                                      );
                                    },
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
                          FutureBuilder<ProductModel>(
                            future: product,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                ProductOverview.withSampleData(snapshot.data);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Color(0xFFFF4646),
                                  )));
                            },
                          ),
                          FutureBuilder<Composition>(
                            future: composition,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                ProductComposition(
                                    nutritionalFacts:
                                        snapshot.data.nutritionalFacts,
                                    ingredients: snapshot.data.ingredients);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Color(0xFFFF4646),
                                  )));
                            },
                          ),
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
