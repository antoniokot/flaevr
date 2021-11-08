import 'package:flaevr/components/allergen.dart';
import 'package:flutter/material.dart';

class Allergens extends StatelessWidget {
  List<String> allergens;
  @override
  Allergens(this.allergens);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 19),
        child: ListView.builder(
          itemCount: allergens.length,
          itemBuilder: (context, index) {
            return Allergen(allergens[index]);
          },
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
        ));
  }
}
