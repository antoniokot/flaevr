import 'package:flaevr/components/allergen.dart';
import 'package:flutter/material.dart';

class Allergens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 19),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Allergen();
          },
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
        ));
  }
}
