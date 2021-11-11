import 'package:flaevr/components/searchBar.dart';
import 'package:flaevr/components/slider.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/styles.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

List<Widget> getHistoryChips() {
  return [
    Container(
      decoration: BoxDecoration(
        color: Styles.ultraLightMutedGrey,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Text(
        "Aloalo",
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
                    child: SearchBar(tipText: "Pesquise algo")),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                image:
                                    AssetImage("lib/assets/images/slider1.png"),
                                fit: BoxFit.cover,
                              ),
                            )),
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
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 19, right: 19),
                    child: Text("Trending",
                        style: TextStyle(color: Styles.textBlack))),
                Container(
                    margin: Styles.sidePaddingWithVerticalSpace,
                    child: Column(
                      children: getTrending(),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 19, right: 19),
                    child: Text("Buscas recentes",
                        style: TextStyle(color: Styles.textBlack))),
                Container(
                    margin: Styles.sidePaddingWithVerticalSpace,
                    child: Wrap(
                      children: () {
                        return getHistoryChips();
                      }(),
                    ))
              ],
            ),
          )),
    );
  }
}
