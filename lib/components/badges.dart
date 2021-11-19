import 'package:flaevr/components/badge.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/services/StampService.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  @override
  Badges({required this.id, this.showLabels = false});

  final int id;
  final bool showLabels;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.showLabels == true ? 115 : 67,
        margin: EdgeInsets.symmetric(horizontal: 19),
        child: FutureBuilder<List<Stamp>?>(
          future: StampService.getAllStampsByProductID(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: snapshot.data!
                    .map((item) => Padding(
                        padding: EdgeInsets.only(right: 21),
                        child: Badge(
                          badge: item,
                          showLabel: this.showLabels,
                        )))
                    .toList()
                    .cast<Widget>(),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Skeleton(
                    height: 67,
                    width: 67,
                    radius: 34,
                    padding: EdgeInsets.only(right: 21));
              },
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            );
          },
        ));
  }
}
