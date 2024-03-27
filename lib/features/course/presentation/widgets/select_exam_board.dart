import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/exam_board.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/exam_board_item.dart';

class SelectExamBoard extends StatefulWidget {
  final List<ExamBoardEntity> examBoards;
  final Function(ExamBoardEntity) onExamBoardSelected;
  const SelectExamBoard(
      {super.key, required this.examBoards, required this.onExamBoardSelected});

  @override
  State<SelectExamBoard> createState() => _SelectExamBoardState();
}

class _SelectExamBoardState extends State<SelectExamBoard> {
  ExamBoardEntity? selectedExamBoard;

  void onClick(int index) {
    setState(() => selectedExamBoard = widget.examBoards[index]);
    widget.onExamBoardSelected(widget.examBoards[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ILColors.light,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  SizedBox(
                    height: 28,
                    width: 28,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Select Exam Board',
                style: TextStyle(
                  color: ILColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 0,
                ),
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1.2,
                  children: widget.examBoards
                      .asMap()
                      .entries
                      .map(
                        (entry) => ExamBoardItem(
                          examBoard: entry.value,
                          index: entry.key,
                          onClick: onClick,
                          selectedExamBoard: selectedExamBoard,
                        ),
                      )
                      .toList(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (selectedExamBoard != null) {
                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 16,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: selectedExamBoard == null
                          ? Colors.grey
                          : ILColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'OK',
                          style: TextStyle(
                            color: ILColors.light,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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
