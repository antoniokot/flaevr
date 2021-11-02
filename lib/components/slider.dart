import 'package:flutter/material.dart';

class SliderCustom extends StatefulWidget {
  SliderCustom({
    Key? key,
    required this.children,
    required this.borderRadius,
    required this.overlap,
    required this.activeColor,
    required this.inactiveColor,
  }) : super(key: key);

  final List<Widget> children;
  final double borderRadius;
  final bool overlap;
  final Color activeColor;
  final Color inactiveColor;

  @override
  SliderState createState() => SliderState();
}

class SliderState extends State<SliderCustom> {
  int _index = 0;

  List<Widget> generateIndexes(int currentIndex) {
    List<Widget> ret = [];
    for (int i = 0; i < this.widget.children.length; i++) {
      ret.add(Container(
          height: 8,
          width: 8,
          margin: EdgeInsets.symmetric(horizontal: 3.5),
          decoration: BoxDecoration(
            color: currentIndex == i
                ? this.widget.activeColor
                : this.widget.inactiveColor,
            borderRadius: BorderRadius.circular(8),
          )));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: this.widget.children.length,
      controller: PageController(viewportFraction: 0.92),
      onPageChanged: (int index) => setState(() => _index = index),
      itemBuilder: (_, i) {
        return Transform.scale(
          scale: i == _index ? 1 : 0.9,
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(this.widget.borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.23),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 14.0,
                    left: ((MediaQuery.of(context).size.width * 0.93) - 30) / 2,
                    child: Row(
                      children: generateIndexes(i),
                    ),
                  ),
                  Positioned(
                      top: this.widget.overlap == false ? 22.0 : 0.0,
                      child: this.widget.children[i])
                ],
              )),
        );
      },
    );
  }
}
