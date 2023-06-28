import 'package:flutter/material.dart';
import 'package:tyrion/src/ui/components/widgets/gapped_doughnut_chart.dart';
import 'package:tyrion/src/utils/theme/theme.dart';

class GameUpdatesOverviewChart extends StatelessWidget {
  final String title;
  final String displayValue;
  final List<int> values;
  final List<Color> colors;

  const GameUpdatesOverviewChart({
    super.key,
    required this.title,
    required this.displayValue,
    required this.values,
    required this.colors,
  });

  final double gapPercent = 25;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 100,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: GappedDoughnutChart(
              values: values.map((e) => e.toDouble()).toList(),
              colors: colors,
              gapPercent: gapPercent,
              backgroundColor: AppTheme.dl.sys.color.surfaceContainerMedium,
              pieRadius: AppTheme.dl.sys.dimension.baseDimension * 2,
              doughnutRadius: AppTheme.dl.sys.dimension.baseDimension * 10,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(displayValue),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
