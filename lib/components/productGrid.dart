import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  @override
  ProductGrid({@required this.physics});

  final ScrollPhysics physics;

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
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.23),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.network(
                        "https://m.media-amazon.com/images/I/81szW4cEfZL._SL1500_.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Color(0xaa0000ff)),
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [Text("Almond Milk")],
                  ),
                )
              ],
            ),
          );
        });
  }
}
