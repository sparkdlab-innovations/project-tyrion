import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GappedDoughnutChart extends StatelessWidget {
  final List<double> values;
  final List<Color> colors;
  final double gapPercent;
  final Color backgroundColor;
  final double pieRadius;
  final double doughnutRadius;

  GappedDoughnutChart({
    super.key,
    required this.values,
    required this.colors,
    this.gapPercent = 30,
    required this.backgroundColor,
    required this.pieRadius,
    this.doughnutRadius = 0,
  }) {
    assert(values.length == colors.length, 'Values and Colors must match');
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: (values.reduce((value, element) => value + element) /
                    (100 - gapPercent)) *
                gapPercent,
            color: backgroundColor,
            radius: pieRadius,
            showTitle: false,
          ),
          ...List.generate(
              values.length,
              (index) => PieChartSectionData(
                    value: values[index],
                    color: colors[index],
                    radius: pieRadius,
                    showTitle: false,
                  )),
        ],
        centerSpaceColor: backgroundColor,
        centerSpaceRadius: doughnutRadius,
        pieTouchData: PieTouchData(enabled: false),
        startDegreeOffset: 18 * (50 - gapPercent) / 10,
        // startDegreeOffset: (360 / 100) * (((100 / 2) - gapPercent)) / 2,
      ),
    );
  }
}
