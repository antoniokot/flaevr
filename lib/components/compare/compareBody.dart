import 'package:flaevr/components/allergen.dart';
import 'package:flaevr/components/compare/cards/allergensCompareCard.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/models/Score.dart';
import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/services/AllergensService.dart';
import 'package:flaevr/services/IngredientService.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/services/ScoresService.dart';
import 'package:flaevr/services/StampService.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

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
  List<Color> _mainColors = [];

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

  Future<List<List<String>>> getAllergens() async {
    List<List<String>> ret = [];
    for (ProductModel p in widget.products) {
      dynamic ingredients = await IngredientService.getByID(p.id!);
      ret.add(AllergenService.getListOfAllergens(ingredients));
    }
    return ret;
  }

  Future<void> getMainColors() async {
    for (ProductModel p in widget.products) {
      print(p.pictureUrl);
      p.pictureUrl != null
          ? _mainColors.add(ColorGenerator.getColorByImportance(
                  await ColorGenerator.getMainColors(
                      new NetworkImage(p.pictureUrl!), new Size(400, 400), 4))!
              .color)
          : _mainColors.add(Color(0xFFFF4646));
    }
    print("colors: " + _mainColors.toString());
    setState(() {});
  }

  @override
  void initState() {
    getMainColors();
    super.initState();
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
                      colors: this._mainColors.length > 0
                          ? this._mainColors
                          : null);
                return CompareGradesCard(
                  scores: [],
                  built: false,
                  products: [],
                );
              }),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: FutureBuilder<List<List<String>?>>(
                  future: getAllergens(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return AllergenCompareCards(
                        products: this.widget.products,
                        colors:
                            this._mainColors.length > 0 ? this._mainColors : [],
                        allergens: snapshot.data!,
                      );
                    return AllergenCompareCards(
                      products: [],
                      colors: [],
                      allergens: [],
                      built: false,
                    );
                  })),
          SizedBox(
            height: 80,
          )
        ]);
  }
}
