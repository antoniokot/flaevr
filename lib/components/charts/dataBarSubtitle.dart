import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DataBarSubtitle extends StatelessWidget {
  const DataBarSubtitle(
      {Key? key, required this.data, this.radius = 15, required this.colors})
      : super(key: key);

  final double radius;
  final List<String> data;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      children: buildDataViewer(),
    );
  }

  List<Widget> buildDataViewer() {
    List<Widget> ret = [];
    for (int i = 0; i < this.data.length; i++) {
      ret.add(
        Container(
            height: 13,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 13,
                  height: 13,
                  decoration: new BoxDecoration(
                      color: colors[i],
                      borderRadius: BorderRadius.all(Radius.circular(radius))),
                ),
                Container(
                  padding: EdgeInsets.only(left: 3),
                  alignment: Alignment.center,
                  child: Text(
                    data[i],
                    style: Styles.smallText,
                  ),
                )
              ],
            )),
      );
    }
    return ret;
  }
}
