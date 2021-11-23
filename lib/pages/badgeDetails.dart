import 'package:flaevr/models/Stamp.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BadgeDetails extends StatelessWidget {
  BadgeDetails({required this.badge});

  final Stamp badge;

  List<Widget> getReq() {
    List<Widget> ret = [];
    List<String> req = [
      "Não possuir em sua composição nada de origem animal.",
      "O produto final não pode ser testado em animais.",
      "Processamento não envolve insumos de origem animal."
    ];
    ret.add(Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "Requisitos",
        style: Styles.mediumTitle,
      ),
    ));

    for (int i = 0; i < req.length; i++) {
      ret.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                    color: Color(0xFF76e75a),
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Text(
                  (i + 1).toString(),
                  style: TextStyle(fontSize: 11, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    req[i],
                    style: Styles.smallText,
                  ))
            ],
          )));
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xFF3d3d4e)),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 19)
                    .add(EdgeInsets.only(bottom: 20)),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 130,
                decoration: new BoxDecoration(
                  color: Styles.ultraLightMutedGrey,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.23),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    child: Row(
                      children: [
                        Container(
                            height: 67,
                            width: 67,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(34.0),
                              child: Image(
                                image: AssetImage("lib/assets/images/badges/" +
                                    this.badge.name +
                                    ".png"),
                                fit: BoxFit.contain,
                              ),
                            )),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(this.badge.name,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Styles.textBlack,
                                          fontWeight: FontWeight.w600))),
                              SizedBox(
                                height: 4,
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text("Selo do Flaevr",
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          color: Styles.mutedGrey,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                        )
                      ],
                    ))),
            Container(
              padding: Styles.sidePaddingWithVerticalSpace
                  .add(EdgeInsets.only(bottom: 15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getReq(),
              ),
            ),
            Container(
              padding: Styles.sidePaddingWithVerticalSpace,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Definição",
                      style: Styles.mediumTitle,
                    ),
                  ),
                  Text(
                    "O veganismo, segundo definição da Vegan Society, é um modo de viver (ou poderíamos chamar apenas de \"escolha\") que busca excluir, na medida do possível e praticável, todas as formas de exploração e crueldade contra os animais - seja na alimentação, no vestuário ou em outras esferas do consumo.",
                    style: Styles.smallText,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        "Fonte: The Vegan Society e Sociedade Vegetariana Brasileira.",
                        style: Styles.noteText,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
