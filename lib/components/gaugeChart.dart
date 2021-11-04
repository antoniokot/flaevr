import 'package:flaevr/utils/styles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  @override
  GaugeChart(this.value,
      {required this.color, required this.animate, this.width = 0.15});

  final Color color;
  final double value;
  final bool animate;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 100,
        pointers: <GaugePointer>[
          RangePointer(
            enableAnimation: animate,
            value: this.value,
            color: this.color,
            cornerStyle: CornerStyle.bothCurve,
            width: this.width,
            sizeUnit: GaugeSizeUnit.factor,
          )
        ],
        showLabels: false,
        showTicks: false,
        axisLineStyle: AxisLineStyle(
          thickness: this.width,
          cornerStyle: CornerStyle.bothCurve,
          color: Styles.ultraLightMutedGrey,
          thicknessUnit: GaugeSizeUnit.factor,
        ),
      )
    ]);
  }
}
