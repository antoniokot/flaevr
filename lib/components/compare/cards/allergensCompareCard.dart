import 'package:flaevr/components/allergens.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class AllergenCompareCards extends StatelessWidget {
  AllergenCompareCards(
      {Key? key,
      required this.allergens,
      required this.colors,
      required this.products,
      this.built = true})
      : super(key: key);

  final List<List<String>?> allergens;
  final List<ProductModel> products;
  final List<Color> colors;
  final bool built;

  Widget build(BuildContext context) {
    return built
        ? Column(children: () {
            List<Widget> ret = [];
            for (int i = 0; i < allergens.length; i++)
              ret.add(Container(
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  child: Card(
                      elevation: 0,
                      borderOnForeground: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Styles.ultraLightMutedGrey,
                      child: Theme(
                        data: ThemeData()
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          leading: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: this.colors.length > 0
                                    ? this.colors[i]
                                    : Color(0xFFFF4646)),
                          ),
                          title: Text(
                            products[i].name ?? "",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w500),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Allergens(
                                allergens[i]!,
                                padding: 0,
                                itemWidth: double.infinity,
                              ),
                            )
                          ],
                        ),
                      ))));
            return ret;
          }())
        : Skeleton(
            width: double.infinity,
            height: 100,
          );
  }
}
