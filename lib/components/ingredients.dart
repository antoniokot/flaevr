import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  List<Widget> generateTable() {
    List<Widget> ret = [
      Container(
          padding: EdgeInsets.only(bottom: 15, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Ingredientes"),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 70,
                      alignment: Alignment.center,
                      child: Text("Alergênico")),
                  Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text("Origem Animal")),
                ],
              )
            ],
          ))
    ];
    for (int i = 0; i < 10; i++) {
      ret.add(Container(
          decoration: BoxDecoration(
              border: new Border(
            bottom: BorderSide(width: 1.0, color: Styles.ultraLightMutedGrey),
          )),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Leite"),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 70,
                      alignment: Alignment.center,
                      child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Styles.textBlack,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ))),
                  Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Styles.lightMutedGrey,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ))),
                ],
              )
            ],
          )));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: Styles.sidePaddingWithVerticalSpace,
        width: (MediaQuery.of(context).size.width * 0.92) - 38,
        child: ListView(
          shrinkWrap: true,
          children: generateTable(),
        ));
  }
}
