import 'package:flaevr/models/NutrientNutrionalFacts.dart';
import 'package:flaevr/models/NutritionalFacts.dart';
import 'package:flaevr/models/NutritionalFactsRow.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class NutritionalValues extends StatelessWidget {
  @override
  NutritionalValues({@required this.nutritionalFacts});

  final List<NutritionalFactsRow> nutritionalFacts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (MediaQuery.of(context).size.width * 0.92) - 38,
        child: ListView(
            shrinkWrap: true,
            padding: Styles.sidePaddingWithVerticalSpace,
            scrollDirection: Axis.vertical,
            children: [
              Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Styles.ultraLightMutedGrey),
                  child: DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                          label: Container(
                            width: 90,
                            child: Text('Porção de 20g'),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            width: 50,
                            child: Text('Qtd por porção'),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            width: 40,
                            child: Text(
                              '%VD*',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                      rows: () {
                        List<DataRow> row;
                        for (int i = 0; i < nutritionalFacts.length; i++) {
                          row.add(new DataRow(cells: [
                            DataCell(Text("Carboidratos")),
                            DataCell(Text(nutritionalFacts[i].value)),
                            DataCell(Text('10')),
                          ]));
                        }
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
