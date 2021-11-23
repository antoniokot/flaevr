import 'package:flaevr/components/badges/badge.dart';
import 'package:flaevr/components/skeleton.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CompareBadgeCard extends StatelessWidget {
  CompareBadgeCard({Key? key, required this.stamps, this.built = true})
      : super(key: key);

  final List<List<Stamp>?> stamps;
  final bool built;

  Widget build(BuildContext context) {
    return built
        ? Container(
            width: (MediaQuery.of(context).size.width - 42),
            margin: EdgeInsets.symmetric(horizontal: 11.5),
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width - 42),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: () {
                          List<Widget> res = [];
                          stamps.forEach((element) {
                            res.add(Container(
                                width:
                                    (MediaQuery.of(context).size.width - 100) /
                                        2,
                                decoration: new BoxDecoration(
                                  color: Styles.ultraLightMutedGrey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.23),
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 7.5, vertical: 10),
                                child: Row(children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 5,
                                    children: () {
                                      List<Widget> ret = [];
                                      element!.forEach((badge) {
                                        ret.add(Badge(
                                          badge: badge,
                                          showLabel: false,
                                          width: 30,
                                          height: 30,
                                        ));
                                      });
                                      ret.removeLast();
                                      return ret;
                                    }(),
                                  )
                                ])));
                          });
                          return res;
                        }()))))
        : Skeleton(
            padding: EdgeInsets.symmetric(horizontal: 14),
            height: 200,
            width: double.infinity,
          );
  }
}
