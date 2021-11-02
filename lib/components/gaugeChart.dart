import 'package:flaevr/utils/styles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  @override
  GaugeChart(this.value, {required this.color, required this.animate});

  final Color color;
  final double value;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 100,
        pointers: <GaugePointer>[
          RangePointer(
            enableAnimation: true,
            value: this.value,
            color: this.color,
            cornerStyle: CornerStyle.bothCurve,
            width: 0.15,
            sizeUnit: GaugeSizeUnit.factor,
          )
        ],
        showLabels: false,
        showTicks: false,
        axisLineStyle: AxisLineStyle(
          thickness: 0.15,
          cornerStyle: CornerStyle.bothCurve,
          color: Styles.ultraLightMutedGrey,
          thicknessUnit: GaugeSizeUnit.factor,
        ),
      )
    ]);
  }
}
