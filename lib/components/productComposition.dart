import 'package:flaevr/components/ingredients.dart';
import 'package:flaevr/components/nutritionalValues.dart';
import 'package:flaevr/components/slider.dart';
import 'package:flutter/cupertino.dart';

class ProductComposition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: SliderCustom(
          children: [NutritionalValues(), Ingredients()],
          borderRadius: 20,
          overlap: false,
          activeColor: Color(0xFFFF4646),
          inactiveColor: Color(0XFFFF9D9D),
        ));
  }
}
