import 'package:flaevr/models/NutrientNutrionalFacts.dart';
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:flaevr/models/NutritionalFactsRow.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class NutritionalValues extends StatelessWidget {
  @override
  NutritionalValues({@required this.nutritionalFacts});

  final NutritionalFacts nutritionalFacts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ((MediaQuery.of(context).size.width * 0.92)),
        child: ListView(
            shrinkWrap: true,
            padding: Styles.smallSidePaddingWithVerticalSpace,
            scrollDirection: Axis.vertical,
            children: [
              Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Styles.ultraLightMutedGrey),
                  child: DataTable(
                      horizontalMargin: 0,
                      columnSpacing: 10,
                      columns: <DataColumn>[
                        DataColumn(
                          label: Container(
                            child: Text(
                              'Porção de 20g',
                              style: Styles.mediumTitle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            child: Text(
                              'Qtd por porção',
                              style: Styles.mediumTitle,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            child: Text(
                              '%VD*',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFF3d3d4e),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                      rows: () {
                        List<DataRow> row = [];
                        if (nutritionalFacts != null) {
                          for (int i = 0;
                              i < nutritionalFacts.nutrients.length;
                              i++) {
                            row.add(new DataRow(cells: [
                              DataCell(Text(
                                "Carboidratos",
                                style: Styles.smallText,
                              )),
                              DataCell(Text(
                                nutritionalFacts.nutrients[i].value,
                                style: Styles.smallText,
                              )),
                              DataCell(Text(
                                '10',
                                style: Styles.smallText,
                              )),
                            ]));
                          }
                          return row;
                        } else
                          return row;
                      }())),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                      "* % Valores diários com base em uma dieta de 2.000 Kcal ou 8.400kj. Seus valores diários podem ser maiores ou menores dependendo de suas necessidades.",
                      style: Styles.noteText)),
            ]));
  }
}
