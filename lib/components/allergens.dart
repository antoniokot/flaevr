import 'package:flaevr/components/allergen.dart';
import 'package:flutter/material.dart';

class Allergens extends StatelessWidget {
  final List<String> allergens;
  @override
  Allergens(this.allergens, {this.padding, this.itemWidth});

  final double? padding;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: padding ?? 19),
        child: ListView.builder(
          itemCount: allergens.length,
          itemBuilder: (context, index) {
            return Allergen(
              allergens[index],
              width: this.itemWidth,
            );
          },
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
        ));
  }
}
