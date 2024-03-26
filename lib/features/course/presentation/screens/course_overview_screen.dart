import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/core/utils/constants/image_strings.dart';
import 'package:inspired_learning_ai/core/utils/constants/text_strings.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/course.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/exam_board.dart';
import 'package:inspired_learning_ai/features/course/presentation/screens/course_content.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/select_exam_board.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/select_target_learning.dart';

class CourseOverviewScreen extends StatefulWidget {
  final CourseEntity course;
  const CourseOverviewScreen({super.key, required this.course});

  @override
  State<CourseOverviewScreen> createState() => _CourseOverviewScreenState();
}

class _CourseOverviewScreenState extends State<CourseOverviewScreen> {
  bool isExpanded = false;
  ExamBoardEntity? selectedExamBoard;
  String targetLearning = '';

  // TODO: fetch exam boards from backend and replace this with real data
  final examBoards = [
    const ExamBoardEntity(id: 'id', name: ILText.aqa, image: ILImages.aqa),
    const ExamBoardEntity(
        id: 'id', name: ILText.edexcel, image: ILImages.edexcel),
    const ExamBoardEntity(id: 'id', name: ILText.ocr, image: ILImages.ocr),
    const ExamBoardEntity(id: 'id', name: ILText.wjec, image: ILImages.wjec),
    const ExamBoardEntity(id: 'id', name: ILText.ccea, image: ILImages.ccea),
    const ExamBoardEntity(id: 'id', name: ILText.sqa, image: ILImages.sqa),
  ];

  // TODO: fetch target learnings from backend and replace this with real data
  final targetLearnings = ['Top Marks (High Tier)', 'Good Marks', 'Pass'];

  void onExamBoardSelected(ExamBoardEntity examBoard) {
    setState(() => selectedExamBoard = examBoard);
  }

  void onTargetLearningSelected(String target) {
    setState(() => targetLearning = target);
  }

  Color get color => selectedExamBoard == null || targetLearning.isEmpty
      ? Colors.grey
      : ILColors.primary;

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
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.course.image,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          ILColors.accent.withOpacity(.8),
                          Colors.transparent,
                        ],
                        stops: const [0.1, 0.6],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.course.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.library_books_outlined,
                                  color: ILColors.textWhite,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '${widget.course.modules.length} modules',
                                  style: const TextStyle(
                                      color: ILColors.textWhite),
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  color: ILColors.textWhite,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  widget.course.courseTotalHours,
                                  style: const TextStyle(
                                      color: ILColors.textWhite),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(
                      color: ILColors.textWhite,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.course.description,
                    style: const TextStyle(
                      color: ILColors.textWhite,
                      fontSize: 16,
                    ),
                    maxLines: isExpanded ? 100 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() => isExpanded = !isExpanded);
                    },
                    child: Row(
                      children: [
                        Text(
                          isExpanded ? 'View less' : 'View more',
                          style: const TextStyle(
                            fontSize: 14.8,
                            color: ILColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: ILColors.primary,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (_, __, ___) => SelectExamBoard(
                            examBoards: examBoards,
                            onExamBoardSelected: onExamBoardSelected,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: selectedExamBoard == null
                          ? const EdgeInsets.all(16)
                          : const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                      decoration: BoxDecoration(
                        color: ILColors.darkContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          selectedExamBoard == null
                              ? const SizedBox()
                              : CircleAvatar(
                                  radius: 20,
                                  backgroundColor: ILColors.light,
                                  backgroundImage: NetworkImage(
                                    selectedExamBoard!.image,
                                  )),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              selectedExamBoard == null
                                  ? 'Select Exam board'
                                  : selectedExamBoard!.name,
                              style: const TextStyle(
                                color: ILColors.textWhite,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (_, __, ___) => SelectTargetLearning(
                            targetLearnings: targetLearnings,
                            onTargetLearningSelected: onTargetLearningSelected,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ILColors.darkContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            targetLearning.isEmpty
                                ? 'Choose Learning Target'
                                : targetLearning,
                            style: const TextStyle(
                              color: ILColors.textWhite,
                              fontSize: 16,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 56),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return CourseContentScreen(course: widget.course);
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Start Course',
                            style: TextStyle(
                              color: ILColors.textWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC857),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Just Test Me',
                          style: TextStyle(
                            color: ILColors.darkContainer,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
