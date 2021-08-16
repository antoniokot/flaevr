import 'package:flaevr/components/badges.dart';
import 'package:flutter/material.dart';

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [Text("12 selos"), Icon(Icons.more)],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Badges()
            ],
          ),
        )
      ],
    );
  }
}
