import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DataBar extends StatelessWidget {
  const DataBar({
    Key? key,
    required this.max,
    required this.data,
    this.background = const Color(0xffE1E1E2),
    this.radius = 10,
    this.height = 10,
    this.separatorStyle = "/",
    this.colors = const [Color(0xFFFF4646)],
    this.width = 200,
  }) : super(key: key);

  final double radius;
  final double height;
  final double width;
  final double max;
  final List<double> data;
  final List<Color> colors;
  final Color background;
  final String separatorStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
            color: this.background,
            borderRadius: new BorderRadius.all(Radius.circular(this.radius))),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(this.radius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: buildDataViewer(),
          ),
        ));
  }

  List<Widget> buildDataViewer() {
    List<Widget> ret = [];
    for (int i = 0; i < this.data.length; i++) {
      ret.add(
        Container(
          height: height,
          width: getWidth(data[i]),
          color: colors.length == data.length
              ? colors[i]
              : Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
      );
    }
    return ret;
  }

  double getWidth(data) {
    var perc = (data * 100) / max;
    return ((perc * width) / 100);
  }
}
