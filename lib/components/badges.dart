import 'package:flaevr/components/badge.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/services/StampService.dart';
import 'package:flaevr/utils/statefulWrapper.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  @override
  Badges(this.id);

  final int id;

  @override
  Widget build(BuildContext context) {
    Future<List<Stamp>> badges;
    getBadges() {
      badges = StampService.getAllStampsByProductID(id);
    }

    return StatefulWrapper(
        onInit: getBadges(),
        child: Container(
            height: 67,
            margin: EdgeInsets.symmetric(horizontal: 19),
            child: FutureBuilder<List<Stamp>>(
              future: badges,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data
                        .map((item) => Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Padding(
                                padding: EdgeInsets.only(right: 14),
                                child: Badge(text: item.name))))
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
                        padding: EdgeInsets.only(right: 14));
                  },
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                );
              },
            )));
  }
}
