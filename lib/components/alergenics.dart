import 'package:flaevr/components/alergenic.dart';
import 'package:flutter/material.dart';

class Alergenics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 19),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Alergenic();
          },
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
        ));
  }
}
