import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';

class CircleProgress extends StatelessWidget {
  final double circleSize;
  final double? circlePadding;
  final double chartSize;
  final double progressValue;
  final double remainingValue;

  const CircleProgress({
    super.key,
    required this.circleSize,
    this.circlePadding,
    required this.chartSize,
    required this.progressValue,
    required this.remainingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: circleSize,
      padding: EdgeInsets.all(circlePadding!),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ILColors.accent,
      ),
      child: EasyPieChart(
        size: chartSize,
        borderEdge: StrokeCap.square,
        pieType: PieType.fill,
        showValue: false,
        children: [
          PieData(value: progressValue, color: ILColors.secondary),
          PieData(value: remainingValue, color: ILColors.textSecondary),
        ],
      ),
    );
  }
}
