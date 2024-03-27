import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/sub_module.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/circle_progress.dart';

class SubModuleItem extends StatelessWidget {
  final SubModule subModule;
  const SubModuleItem({super.key, required this.subModule});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleProgress(
                circleSize: 30,
                circlePadding: 4,
                chartSize: 16,
                progressValue: 1,
                remainingValue: 0.8,
              ),
              const SizedBox(width: 10),
              Text(
                subModule.title,
                style: const TextStyle(color: ILColors.textWhite, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subModule.microModules
                .map((module) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleProgress(
                            circleSize: 22,
                            circlePadding: 6,
                            chartSize: 12,
                            progressValue: 0,
                            remainingValue: 1,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            module.title,
                            style: const TextStyle(
                                color: ILColors.textWhite, fontSize: 14),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
