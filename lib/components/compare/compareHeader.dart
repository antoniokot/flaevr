import 'package:flaevr/components/product/productCard.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class CompareHeader extends StatelessWidget {
  CompareHeader({Key? key, required this.products}) : super(key: key);

  final List<ProductModel> products;

  List<Widget> buildProductVersus(Size size) {
    List<Widget> ret = [];
    for (int i = 0; i < products.length; i++) {
      i == products.length - 1
          ? ret.add(
              ProductCard(
                  heightAspectRatio: new AspectRatio(aspectRatio: 1.43),
                  width: (size.width - 100) / 2,
                  product: products[i]),
            )
          : ret.addAll([
              ProductCard(
                  heightAspectRatio: new AspectRatio(aspectRatio: 1.43),
                  width: (size.width - 100) / 2,
                  product: products[i]),
              Container(
                  color: Styles.ultraLightMutedGrey, height: 220, width: 2),
            ]);
    }
    return ret;
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildProductVersus(size)));
  }
}
