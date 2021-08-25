import 'package:flaevr/components/alergenics.dart';
import 'package:flaevr/components/badges.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProductOverview extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ProductOverview(this.seriesList, {this.animate, mainColor});

  /// Creates a [PieChart] with sample data and no transition.
  factory ProductOverview.withSampleData() {
    return new ProductOverview(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double chartSize = MediaQuery.of(context).size.width / 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          child: Row(
            children: [Text("12 selos"), Icon(Icons.more_horiz)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Badges(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          child: Row(
            children: [Text("Resumo"), Icon(Icons.more_horiz)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: chartSize,
                    height: chartSize,
                    child: charts.PieChart(seriesList,
                        animate: animate,
                        // Configure the width of the pie slices to 60px. The remaining space in
                        // the chart will be left as a hole in the center.
                        defaultRenderer:
                            new charts.ArcRendererConfig(arcWidth: 8)),
                  ),
                  Text("8/10"),
                  Positioned(
                    bottom: 0,
                    child: Text("Saúde"),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: chartSize,
                    height: chartSize,
                    child: charts.PieChart(seriesList,
                        animate: animate,
                        // Configure the width of the pie slices to 60px. The remaining space in
                        // the chart will be left as a hole in the center.
                        defaultRenderer:
                            new charts.ArcRendererConfig(arcWidth: 8)),
                  ),
                  Text("8/10"),
                  Positioned(
                    bottom: 0,
                    child: Text("Nutrientes"),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: chartSize,
                    height: chartSize,
                    child: charts.PieChart(seriesList,
                        animate: animate,
                        // Configure the width of the pie slices to 60px. The remaining space in
                        // the chart will be left as a hole in the center.
                        defaultRenderer:
                            new charts.ArcRendererConfig(arcWidth: 8)),
                  ),
                  Text("8/10"),
                  Positioned(
                    bottom: 0,
                    child: Text("Meio-ambiente"),
                  ),
                ],
              ),
            ]),
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 26, right: 19, left: 19),
          child: Row(
            children: [Text("Alergênicos"), Icon(Icons.more_horiz)],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Alergenics()
      ],
    );
  }

  static List<charts.Series<LinearScores, int>> _createSampleData() {
    final data = [
      new LinearScores(80, charts.ColorUtil.fromDartColor(Colors.blue)),
      new LinearScores(
          20, charts.ColorUtil.fromDartColor(Styles.lightMutedGrey)),
    ];

    return [
      new charts.Series<LinearScores, int>(
        id: 'Scores',
        domainFn: (LinearScores scores, _) => scores.scores,
        measureFn: (LinearScores scores, _) => scores.scores,
        colorFn: (LinearScores scores, _) => scores.color,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearScores {
  final int scores;
  final charts.Color color;

  LinearScores(this.scores, this.color);
}
