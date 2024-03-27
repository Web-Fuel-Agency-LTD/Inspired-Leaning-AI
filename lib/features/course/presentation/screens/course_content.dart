import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/core/utils/constants/text_strings.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/course.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/module_item.dart';
import 'package:progresso/progresso.dart';

class CourseContentScreen extends StatefulWidget {
  final CourseEntity course;
  const CourseContentScreen({super.key, required this.course});

  @override
  State<CourseContentScreen> createState() => _CourseContentScreenState();
}

class _CourseContentScreenState extends State<CourseContentScreen> {
  bool isExpanded = false;
  double getCoursePercent() {
    return (widget.course.progress / widget.course.modules.length) * 100;
  }

  String getCourseProgress() {
    if (widget.course.progress == 0) {
      return ILText.notStarted;
    } else if (widget.course.progress < widget.course.modules.length &&
        widget.course.progress > 0) {
      return ILText.inProgress;
    } else {
      return ILText.completed;
    }
  }

  void expandModule(bool expand) {
    setState(() => isExpanded = expand);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ILColors.dark,
      appBar: AppBar(
        title: Text(
          widget.course.name,
          style: const TextStyle(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getCourseProgress(),
                  style: const TextStyle(
                    color: ILColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${getCoursePercent().toStringAsFixed(0)}%',
                  style: const TextStyle(
                    color: ILColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 24,
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: ILColors.primary,
              ),
              child: Progresso(
                progress: getCoursePercent() / 100,
                progressStrokeWidth: 14,
                backgroundStrokeWidth: 14,
                progressColor: ILColors.secondary,
                backgroundColor: ILColors.textSecondary,
                progressStrokeCap: StrokeCap.round,
                backgroundStrokeCap: StrokeCap.round,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Course Content',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: ILColors.textWhite,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              children: widget.course.modules
                  .asMap()
                  .entries
                  .map((module) => ModuleItem(
                        module: module.value,
                        expandModule: expandModule,
                        isExpanded: isExpanded,
                        index: module.key + 1,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
