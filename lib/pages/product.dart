import 'package:flaevr/components/favoriteSelectionModal.dart';
import 'package:flaevr/components/notFound.dart';
import 'package:flaevr/components/product/nutriData.dart';
import 'package:flaevr/components/product/productComposition.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Composition.dart';
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:flaevr/models/User.dart';
import 'package:flaevr/pages/favorites.dart';
import 'package:flaevr/services/IngredientService.dart';
import 'package:flaevr/services/NutritionalService.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/components/product/productOverview.dart';
import 'package:flaevr/components/sliverScaffold.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'package:flaevr/utils/sessionManager.dart';
import 'package:flaevr/utils/statefulWrapper.dart';
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
  ProductModel? prodProp;
  Future<Composition?>? composition;
  bool empty = false;
  User? user;

  var top = 0.0;
  var _mainColor;
  var textColor;
  final List<Widget> myTabs = [
    Tab(text: 'Resumo'),
    Tab(text: 'Composição'),
    Tab(text: 'Detalhes'),
  ];
  TabController? _tabController;
  void getUser() async {
    this.user = User.fromJson(await FlutterSession().get("user"));
  }

  @override
  void initState() {
    super.initState();
    String? imageUrlToFetch;
    getUser();
    if (widget.barcode != "" && widget.barcode != null) {
      fetchAllByBarcode().then((v) {
        imageUrlToFetch = v!.pictureUrl;
      });
    } else if (widget.prod != null) {
      this.product = getProductAsync();
      imageUrlToFetch = this.widget.prod!.pictureUrl;
      fetchAll(this.widget.prod!.id!);
    } else {
      print(
          "\x1B[33mproduct.dart: An error appeared while fetching a product.\x1B[0m");
    }
    getProduct();

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

  Future<ProductModel?> fetchAllByBarcode() async {
    ProductModel? prod;
    this.product = ProductService.getByBarcode(widget.barcode!);
    prod = await product;
    if (prod == null)
      this.empty = true;
    else {
      ProductService.postScannedItem(this.user!.id!, prod.id!);
    }

    this.composition = fetchComposition(prod!.id!);
    setState(() {});
    return prod;
  }

  Future<ProductModel?> getProductAsync() async {
    return this.widget.prod;
  }

  Future<Composition> fetchComposition(int id) async {
    var a = new Composition(
        nutritionalFacts: await NutriotinalService.getByID(id) ??
            new NutritionalFacts(
                id: -1, idProduct: -1, serving: "0g", nutrients: []),
        ingredients: await IngredientService.getByID(id) ?? []);
    return a;
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

  void getProduct() async {
    this.prodProp = await product;
  }

  _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.empty == true)
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: textColor),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Container(
                      height: 150,
                      child: NotFound(
                        text: "Produto não encontrado.",
                      )))));
    else
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
                                  return FavoriteSelectionModal(
                                    idUser: this.user!.id!,
                                    idProduct: this.prodProp!.id ?? 1,
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
                                                fontSize: 14.0,
                                                color: textColor),
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
                            FutureBuilder(
                              future: Future.wait([
                                product == null
                                    ? new Future.delayed(new Duration(days: 1))
                                    : product as Future<dynamic>,
                                composition == null
                                    ? new Future.delayed(new Duration(days: 1))
                                    : composition as Future<dynamic>
                              ]),
                              builder: (context,
                                  AsyncSnapshot<List<dynamic>> snapshot) {
                                if (snapshot.hasData) {
                                  return ProductOverview(
                                    snapshot.data![0],
                                    ingredients: snapshot.data![1],
                                    animate: true,
                                    color: this._mainColor ?? Colors.blue,
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        200,
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
                                  return NutriData(
                                      user: this.user,
                                      dataBarSize:
                                          MediaQuery.of(context).size.width -
                                              38,
                                      nutritionalFacts:
                                          snapshot.data!.nutritionalFacts,
                                      ingredients: snapshot.data!.ingredients);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        200,
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
                                          snapshot.data!.nutritionalFacts,
                                      ingredients: snapshot.data!.ingredients);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        200,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      valueColor:
                                          new AlwaysStoppedAnimation<Color>(
                                              Color(0xFFFF4646)),
                                    )));
                              },
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
