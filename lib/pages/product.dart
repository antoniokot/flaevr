import 'package:flaevr/components/productComposition.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Composition.dart';
import 'package:flaevr/pages/favorites.dart';
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
  Product({Key? key, this.barcode, this.prod}) : super(key: key);

  final String? barcode;
  final ProductModel? prod;

  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Product> with SingleTickerProviderStateMixin {
  //will be fetched on initState
  Future<ProductModel?>? product;
  Future<Composition?>? composition;

  var top = 0.0;
  var _mainColor;
  var textColor;
  final List<Widget> myTabs = [
    Tab(text: 'Resumo'),
    Tab(text: 'Composição'),
    Tab(text: 'Sustentabilidade'),
  ];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    String? imageUrlToFetch;
    if (widget.barcode != "" && widget.barcode != null) {
      this.product =
          ProductService.getByBarcode(widget.barcode!).then((ProductModel? p) {
        imageUrlToFetch = p!.pictureUrl;
        fetchAll(p.id!);
        return p;
      });
    } else if (widget.prod != null && widget.prod!.id! > 0) {
      this.product = getProductAsync();
      imageUrlToFetch = this.widget.prod!.pictureUrl;
      fetchAll(this.widget.prod!.id!);
    } else {
      print("deu erroooo");
    }

    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(_handleTabSelection);

    if (imageUrlToFetch == null)
      imageUrlToFetch =
          "https://www.webpackaging.com/Up/Comp/1220/11116249/12336095-EFNGZGDX/i/prev/tetra-top-water.jpg";
    getMainColors(new NetworkImage(imageUrlToFetch!), new Size(1000, 200));
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  //talvez retorne um dicionario
  Future<void> fetchAll(int id) async {
    if (this.product == null) this.product = ProductService.getByID(id);

    this.composition = fetchComposition(id);
    //fetch tabela nutricional, meio ambiente e selos
  }

  Future<ProductModel?> getProductAsync() async {
    return this.widget.prod;
  }

  Future<Composition> fetchComposition(int id) async {
    var c = new Composition(
        nutritionalFacts: await NutriotinalService.getByID(id),
        ingredients: await IngredientService.getByID(id));

    return c;
  }

  Future<void> getMainColors(ImageProvider img, Size size) async {
    await ColorGenerator.getMainColors(img, size, 4).then((value) => {
          _mainColor = ColorGenerator.getColorByImportance(value)?.color,
          setState(() {
            adjustBrightness(_mainColor);
          }),
          if (mounted) setState(() {})
        });
  }

  void adjustBrightness(Color color) {
    textColor = ThemeData.estimateBrightnessForColor(color) == Brightness.light
        ? Color(0xFF3d3d4e)
        : Colors.white;
  }

  _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 2,
            child: SliverScaffold(
              physics: BouncingScrollPhysics(),
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
                          Icons.bookmark_border,
                          color: textColor,
                        ),
                        tooltip: 'Add to favorites',
                        onPressed: () {
                          showModalBottomSheet<void>(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20))),
                                  height:
                                      MediaQuery.of(context).size.height - 100,
                                  child: Center(
                                      child: Favorites(
                                    built: false,
                                    folders: [],
                                    onClick: () {
                                      print("malignoo");
                                      Navigator.pop(context);
                                    },
                                  )),
                                );
                              });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: textColor,
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
                      if (_mainColor == null)
                        return Colors.blue;
                      else
                        return _mainColor;
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
                                  child: FutureBuilder<ProductModel?>(
                                    future: product,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data!.name!.split(",")[0],
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
                          background: FutureBuilder<ProductModel?>(
                            future: product,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.pictureUrl != null)
                                  return Image.network(
                                    snapshot.data!.pictureUrl!,
                                    fit: BoxFit.cover,
                                  );
                                else
                                  return Image.asset(
                                    'lib/assets/images/404.gif',
                                    fit: BoxFit.cover,
                                  );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return Image.network(
                                "https://www.webpackaging.com/Up/Comp/1220/11116249/12336095-EFNGZGDX/i/prev/tetra-top-water.jpg",
                                fit: BoxFit.cover,
                              );
                            },
                          ));
                    })),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: [
                          FutureBuilder<ProductModel?>(
                            future: product,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ProductOverview(
                                  snapshot.data!,
                                  animate: true,
                                  color: this._mainColor,
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Color(0xFFFF4646)),
                                  )));
                            },
                          ),
                          FutureBuilder<Composition?>(
                            future: composition,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ProductComposition(
                                    nutritionalFacts:
                                        snapshot.data!.nutritionalFacts!,
                                    ingredients: snapshot.data!.ingredients!);
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Color(0xFFFF4646)),
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
                        ][_tabController!.index],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
