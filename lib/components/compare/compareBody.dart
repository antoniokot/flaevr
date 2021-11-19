import 'package:flaevr/models/ProductModel.dart';
import 'package:flutter/material.dart';

class CompareBody extends StatefulWidget {
  CompareBody({Key? key, required this.products}) : super(key: key);

  final List<ProductModel> products;

  @override
  CompareBodyState createState() => CompareBodyState();
}

class CompareBodyState extends State<CompareBody> {
  Widget build(BuildContext context) {
    return Container();
  }
}
