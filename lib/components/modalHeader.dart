import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class ModalHeader extends StatelessWidget {
  @override
  ModalHeader(
      {required this.title,
      this.padding,
      this.actions,
      this.borderRadius,
      this.backgroundColor});

  final String title;
  final EdgeInsets? padding;
  final List<Widget>? actions;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? EdgeInsets.symmetric(vertical: 10, horizontal: 19),
        decoration: BoxDecoration(
            borderRadius:
                borderRadius ?? BorderRadius.vertical(top: Radius.circular(20)),
            color: backgroundColor ?? Colors.white),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => {Navigator.pop(context)},
          ),
          Text(
            title,
            style: Styles.smallTitle,
          ),
          Row(
            children: actions ?? [],
          )
        ]));
  }
}
