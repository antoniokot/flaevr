import 'dart:convert';

import 'package:flaevr/components/searchBar.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/components/slider.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/pages/results.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/utils/sessionManager.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/styles.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

List<Widget> getHistoryChips(List<String> searches, dynamic context) {
  return [
    InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Styles.ultraLightMutedGrey,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          searches.length > 0 ? searches[0] : "Sem pesquisas recentes",
          style: new TextStyle(color: Color(0XFFbababa)),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Results(searched: searches.length > 0 ? searches[0] : null),
            )),
      },
    ),
    searches != null && searches.length > 1
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
          )
        : Container(),
    searches != null && searches.length > 1
        ? InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Styles.ultraLightMutedGrey,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                searches[1],
                style: new TextStyle(color: Color(0XFFbababa)),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(searched: searches[1]),
                  )),
            },
          )
        : Container(),
    searches != null && searches.length > 1
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
          )
        : Container(),
    searches != null && searches.length > 2
        ? InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Styles.ultraLightMutedGrey,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                searches[2],
                style: new TextStyle(color: Color(0XFFbababa)),
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(searched: searches[2]),
                  )),
            },
          )
        : Container(),
  ];
}

List<Widget> getTrending(List<ProductModel>? products) {
  List<Widget> ret = [];
  if (products != null) {
    for (int i = 0; i < (products.length >= 5 ? 5 : products.length); i++) {
      ret.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 70, 70, 1),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Text(
                  (i + 1).toString(),
                  style: TextStyle(fontSize: 11, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(products[i].name ?? "Teste"))
            ],
          )));
    }
  } else {
    for (int i = 0; i < 5; i++) {
      ret.add(Skeleton(
        height: 14,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 9),
      ));
    }
  }
  return ret;
}

class SearchState extends State<Search> {
  List<String> searches = [];

  void getRecentSearches() async {
    await FlutterSession().get("searches").then((json) async {
      this.searches = json.cast<String>();
    });
  }

  Future<void> refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    getRecentSearches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: RefreshIndicator(
              color: Color(0xFFFF4646),
              onRefresh: () => refresh(),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                        padding: Styles.sidePadding,
                        child: Container(
                          child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF1F1F2),
                                prefixIcon: Icon(Icons.search),
                                labelText: "Pesquise algo",
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onSubmitted: (String value) => {
                                    setState(() {
                                      searches != null
                                          ? searches.insert(0, value)
                                          : searches = [value];
                                      FlutterSession()
                                          .set("searches", searches);
                                    }),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Results(searched: value),
                                        )),
                                  }),
                          height: 45,
                        )),
                    SizedBox(height: 20),
                    SizedBox(
                        height: 200, // card height
                        child: SliderCustom(
                          borderRadius: 20,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "lib/assets/images/slider1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.92,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "lib/assets/images/slider2.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          ],
                          overlap: true,
                          activeColor: Color(0xFFFF4646),
                          inactiveColor: Color(0XFFFF9D9D),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 19, right: 19),
                        child: Text("Trending",
                            style: TextStyle(color: Styles.textBlack))),
                    Container(
                        margin: Styles.sidePaddingWithVerticalSpace,
                        child: FutureBuilder<List<ProductModel>?>(
                          future: ProductService.getAllTrendingProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: getTrending(snapshot.data),
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return Column(
                              children: getTrending(null),
                            );
                          },
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 20, left: 19, right: 19),
                        child: Text("Buscas recentes",
                            style: TextStyle(color: Styles.textBlack))),
                    Container(
                        margin: Styles.sidePaddingWithVerticalSpace,
                        child: Wrap(
                          children: () {
                            return getHistoryChips(this.searches, context);
                          }(),
                        ))
                  ],
                ),
              ))),
    );
  }
}
