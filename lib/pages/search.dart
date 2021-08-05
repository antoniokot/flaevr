import 'package:flaevr/components/searchBar.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  SearchState createState() => SearchState();
}

List<Widget> getHistoryChips() {
  return [
    Container(
      decoration: BoxDecoration(
        color: Color(0xffEFF3F5),
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
  int _index = 0;
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
                    padding: EdgeInsets.symmetric(horizontal: 19),
                    child: SearchBar(tipText: "Pesquise algo")),
                SizedBox(height: 20),
                SizedBox(
                  height: 200, // card height
                  child: PageView.builder(
                    itemCount: 10,
                    controller: PageController(viewportFraction: 0.92),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Card ${i + 1}",
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 19, right: 19),
                    child: Text("Trending")),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                    child: Column(
                      children: getTrending(),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 19, right: 19),
                    child: Text("Buscas recentes")),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 19, vertical: 10),
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
