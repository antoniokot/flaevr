import 'dart:convert';

import 'package:flaevr/components/searchBar.dart';
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

List<Widget> getHistoryChips(List<String>? searches) {
  return [
    Container(
      decoration: BoxDecoration(
        color: Styles.ultraLightMutedGrey,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Text(
        searches != null ? searches[0] : "Sem pesquisas recentes",
        style: new TextStyle(color: Color(0XFFbababa)),
      ),
    )
  ];
}

List<Widget> getTrending() {
  return [
    Row(
      children: [
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 70, 70, 1),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          child: Text(
            "1",
            style: TextStyle(fontSize: 11, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text("Iogurte Grego Vigor"))
      ],
    )
  ];
}

class SearchState extends State<Search> {
  List<ProductModel>? allProducts;
  String nameSearched = "";
  List<String>? searches;

  void getRecentSearches() async{
    await FlutterSession().get("searches").then((json) async {
      this.searches = jsonDecode(json);
      print(this.searches);
    });
  }

  Future<List<ProductModel>?> getListsAsync() async {
    if (allProducts == null) {
      this.allProducts = await ProductService.getAllProducts();
      return await ProductService.getAllProducts();
    }
    return allProducts!.where((p) => p.name!.toLowerCase().contains(this.nameSearched)).toList();
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
          body: SingleChildScrollView(
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
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (String value) => {
                        setState(() {
                          searches != null ? searches!.insert(0, value) : searches = [value];
                          FlutterSession().set("searches", jsonEncode(searches));
                        }),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Results(searched: value),
                            )
                        ),
                      }
                    ),
                    height: 45,
                  )
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200, // card height
                  child: SliderCustom(
                    borderRadius: 20,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.92,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage("lib/assets/images/slider1.png"),
                            fit: BoxFit.cover,
                          ),
                        )
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                              image:
                                  AssetImage("lib/assets/images/slider2.png"),
                              fit: BoxFit.cover,
                            ),
                          )),
                    ],
                    overlap: true,
                    activeColor: Color(0xFFFF4646),
                    inactiveColor: Color(0XFFFF9D9D),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 19, right: 19),
                  child: Text(
                    "Trending",
                    style: TextStyle(color: Styles.textBlack)
                  )
                ),
                Container(
                  margin: Styles.sidePaddingWithVerticalSpace,
                  child: Column(
                    children: getTrending(),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 19, right: 19),
                  child: Text(
                    "Buscas recentes",
                    style: TextStyle(color: Styles.textBlack)
                  )
                ),
                Container(
                  margin: Styles.sidePaddingWithVerticalSpace,
                  child: Wrap(
                    children: () {
                      return getHistoryChips(this.searches);
                    }(),
                  )
                )
              ],
            ),
          )
      ),
    );
  }
}
