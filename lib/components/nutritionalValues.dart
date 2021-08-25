import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class NutritionalValues extends StatelessWidget {
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
                    rows: <DataRow>[
                      DataRow(
                        cells: [
                          DataCell(Text("alo")),
                          DataCell(Text('19')),
                          DataCell(Text('Student')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Janine')),
                          DataCell(Text('43')),
                          DataCell(Text('Professor')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('William')),
                          DataCell(Text('27')),
                          DataCell(Text('Associate Professor')),
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                      "* % Valores diários com base em uma dieta de 2.000 Kcal ou 8.400kj. Seus valores diários podem ser maiores ou menores dependendo de suas necessidades.",
                      style: Styles.noteText)),
            ]));
  }
}
