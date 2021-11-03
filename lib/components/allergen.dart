import 'package:flaevr/utils/styles.dart';
import 'package:flaevr/utils/utility.dart';
import 'package:flutter/material.dart';

class Allergen extends StatelessWidget {
  String allergen;
  @override
  Allergen(this.allergen);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 20,
        height: 66,
        decoration: BoxDecoration(
            color: Styles.ultraLightMutedGrey,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color:
                          Color(0xFFD5242A).withOpacity(0.8), // verde: 3DE639
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                      child: Text(
                    allergen[0].toUpperCase() + allergen[1].toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 14),
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width - 98,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(Utility.capitalize(allergen),
                            style: Styles.smallTitle),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Este produto contém ou pode conter traços de " +
                              allergen.toLowerCase(),
                          style: Styles.smallText,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
