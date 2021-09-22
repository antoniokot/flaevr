import 'package:flaevr/components/productCard.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  @override
  ProductGrid({@required this.physics, this.built = false});

  final ScrollPhysics physics;
  final bool built;

  int getGridCount(s) {
    if (s.width > 600 && s.width < 750)
      return 3;
    else if (s.width >= 750 && s.width < 1100)
      return 4;
    else if (s.width >= 1100)
      return 5;
    else
      return 2;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridView.builder(
        shrinkWrap: true,
        physics: physics,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getGridCount(size), childAspectRatio: 1 / 1.35),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          if (built)
            return ProductCard(
              heightAspectRatio: new AspectRatio(aspectRatio: 2.3),
              width: 190,
            );
          else
            return Skeleton(width: 190, height: 190 * 2.3);
        });
  }
}
