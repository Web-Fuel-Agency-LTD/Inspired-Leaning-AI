import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/components/measure_size.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/course_module.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/circle_progress.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/content_and_test_button.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/sub_module_item.dart';

class ModuleItem extends StatefulWidget {
  const ModuleItem({
    super.key,
    required this.module,
    required this.expandModule,
    required this.isExpanded,
    required this.index,
  });

  final CourseModule module;
  final Function expandModule;
  final bool isExpanded;
  final int index;

  @override
  State<ModuleItem> createState() => _ModuleItemState();
}

class _ModuleItemState extends State<ModuleItem> {
  late bool isExpanded;
  double subModuleHeight = Size.zero.height;
  late bool completeModule;
  double defaultHeight = 66;

  bool boxTopSpacing() =>
      isExpanded && widget.module.progress > 0 && !completeModule;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
    completeModule = widget.module.progress >= widget.module.subModules.length;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isExpanded = !isExpanded);
        widget.expandModule(isExpanded);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
        height: isExpanded ? subModuleHeight + defaultHeight : defaultHeight,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ILColors.darkContainer,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isExpanded ? ILColors.primary : ILColors.darkContainer,
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Visibility(
                    visible: !isExpanded,
                    child: CircleProgress(
                      circleSize: 36,
                      circlePadding: 8,
                      chartSize: 20,
                      progressValue: widget.module.progress,
                      remainingValue: completeModule
                          ? 0
                          : widget.module.subModules.length.toDouble(),
                    ),
                  ),
                  Visibility(
                    visible: isExpanded && !completeModule,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: widget.module.progress <= 0 ? 0 : 12),
                      child: CircleProgress(
                        circleSize: 36,
                        circlePadding: 8,
                        chartSize: 20,
                        progressValue: widget.module.progress,
                        remainingValue: completeModule
                            ? 0
                            : widget.module.subModules.length.toDouble(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isExpanded && completeModule,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: CircleProgress(
                        circleSize: 36,
                        circlePadding: 8,
                        chartSize: 20,
                        progressValue: widget.module.progress,
                        remainingValue: completeModule
                            ? 0
                            : widget.module.subModules.length.toDouble(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Visibility(
                              visible: !isExpanded,
                              child: Text(
                                widget.module.name,
                                style: const TextStyle(
                                  color: ILColors.textWhite,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: widget.module.progress > 0,
                              child: Row(
                                children: [
                                  Icon(
                                    completeModule
                                        ? Icons.check
                                        : Icons.hourglass_empty_rounded,
                                    color: completeModule
                                        ? ILColors.secondary
                                        : ILColors.primary,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    completeModule
                                        ? 'COMPLETED'
                                        : 'IN PROGRESS',
                                    style: TextStyle(
                                      color: completeModule
                                          ? ILColors.secondary
                                          : ILColors.primary,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                isExpanded
                                    ? '${widget.index}. ${widget.module.title}'
                                    : widget.module.title,
                                style: const TextStyle(
                                  color: ILColors.textWhite,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Visibility(
                                visible: isExpanded && !completeModule,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        opaque: false,
                                        pageBuilder: (_, __, ___) =>
                                            const ModuleContentAndTest(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        top: boxTopSpacing() ? 10 : 0),
                                    decoration: const BoxDecoration(
                                        color: ILColors.primary,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: ILColors.textSecondary,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              MeasureSize(
                onChange: (size) =>
                    setState(() => subModuleHeight = size.height + 28),
                child: Visibility(
                  visible: isExpanded,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.module.subModules
                        .map((subModule) => SubModuleItem(subModule: subModule))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
