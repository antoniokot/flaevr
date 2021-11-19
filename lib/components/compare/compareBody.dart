import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/models/Score.dart';
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/services/ScoresService.dart';
import 'package:flaevr/services/StampService.dart';
import 'package:flutter/material.dart';

import 'cards/compareBadgeCard.dart';
import 'cards/compareGradesCard.dart';
import 'cards/compareOverviewCard.dart';

class CompareBody extends StatefulWidget {
  CompareBody({Key? key, required this.products}) : super(key: key);

  final List<ProductModel> products;

  @override
  CompareBodyState createState() => CompareBodyState();
}

class CompareBodyState extends State<CompareBody> {
  Future<List<Score?>> getScores() async {
    List<Score?> ret = [];
    for (ProductModel p in widget.products) {
      ret.add(await ScoresService.getScoresById(p.id!));
    }
    return ret;
  }

  Future<List<List<Stamp>?>> getStampLists() async {
    List<List<Stamp>?> ret = [];
    for (ProductModel p in widget.products) {
      ret.add(await StampService.getAllStampsByProductID(p.id!));
    }
    return ret;
  }

  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<List<List<Stamp>?>>(
              future: getStampLists(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return CompareBadgeCard(
                    stamps: snapshot.data!,
                  );
                return CompareBadgeCard(stamps: [], built: false);
              }),
          FutureBuilder<List<Score?>>(
              future: getScores(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return CompareGradesCard(
                    scores: snapshot.data!,
                    products: this.widget.products,
                  );
                return CompareGradesCard(
                  scores: [],
                  built: false,
                  products: [],
                );
              }),

          //CompareBadgeCard(products: this.widget.products),
        ]);
  }
}
