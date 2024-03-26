import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/exam_board.dart';

class ExamBoardItem extends StatelessWidget {
  final ExamBoardEntity examBoard;
  final int index;
  final Function(int) onClick;
  final ExamBoardEntity? selectedExamBoard;
  const ExamBoardItem({
    super.key,
    required this.examBoard,
    required this.onClick,
    required this.index,
    required this.selectedExamBoard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => onClick(index),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: ILColors.lightContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selectedExamBoard == null
                    ? ILColors.textSecondary.withOpacity(.6)
                    : selectedExamBoard!.name == examBoard.name
                        ? ILColors.primary
                        : ILColors.textSecondary.withOpacity(.6),
                width: 1.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 52,
                child: Stack(
                  children: [
                    selectedExamBoard == null
                        ? const SizedBox()
                        : Visibility(
                            visible: selectedExamBoard!.name == examBoard.name,
                            child: const Positioned(
                                top: 0,
                                right: 0,
                                child: Icon(
                                  Icons.check_circle,
                                  color: ILColors.primary,
                                  size: 20,
                                )),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: examBoard.image,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fitHeight,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: Text(
            examBoard.name,
            style: const TextStyle(
              color: ILColors.dark,
              fontSize: 12.4,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
