import 'package:flaevr/components/nutriData.dart';
import 'package:flaevr/models/Composition.dart';
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:flaevr/models/ProductModel.dart';
import 'package:flaevr/services/IngredientService.dart';
import 'package:flaevr/services/NutritionalService.dart';
import 'package:flaevr/services/ProductService.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flaevr/utils/colorGenerator.dart';
import 'dart:async';

class CompareCard extends StatefulWidget {
  @override
  CompareCard(
      {required this.heightAspectRatio,
      required this.width,
      required this.product})
      : assert(heightAspectRatio.aspectRatio > 0 && width > 0);

  final AspectRatio heightAspectRatio;
  final double width;
  final ProductModel product;
  @override
  CompareCardState createState() => CompareCardState();
}

class CompareCardState extends State<CompareCard> {
  var _mainColor;
  Composition? composition;

  @override
  void initState() {
    super.initState();
    getMainColors(
        new NetworkImage(this.widget.product.pictureUrl != null
            ? this.widget.product.pictureUrl.toString()
            : "https://media.istockphoto.com/photos/doing-business-with-a-smile-picture-id1330547068?s=612x612"),
        new Size(500, 500));

    fetchComposition(this.widget.product.id!);
  }

  Future<void> getMainColors(ImageProvider img, Size size) async {
    await ColorGenerator.getMainColors(img, size, 4).then((value) => {
          _mainColor = ColorGenerator.getColorByImportance(value)?.color,
          if (mounted) setState(() {})
        });
  }

  Future<void> fetchComposition(int id) async {
    this.composition = new Composition(
        nutritionalFacts: await NutriotinalService.getByID(id) ??
            new NutritionalFacts(
                id: -1, idProduct: -1, serving: "0g", nutrients: []),
        ingredients: await IngredientService.getByID(id) ?? []);
    //fetch tabela nutricional, meio ambiente e selos
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.23),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: widget.width / 2,
                height: 125,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(16)),
                    color: _mainColor),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16)),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Image.network(
                        this.widget.product.pictureUrl != null
                            ? this.widget.product.pictureUrl as String
                            : "https://media.istockphoto.com/photos/doing-business-with-a-smile-picture-id1330547068?s=612x612",
                        fit: BoxFit.contain,
                      )),
                ),
              ),
              Container(
                width: widget.width / 2,
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 125,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(16)),
                    color: Colors.white),
                //width: double.infinity,
                //height: 65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        this.widget.product.name!.split(',')[0],
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff3d3d4e),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        this.widget.product.name!.split(',')[1],
                        style: TextStyle(
                            fontSize: 13,
                            color: Styles.mutedGrey,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          this.composition != null
              ? NutriData(
                  ingredients: this.composition!.ingredients,
                  nutritionalFacts: this.composition!.nutritionalFacts)
              : Container(),
        ],
      ),
    );
  }
}
