import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inspired_learning_ai/core/utils/components/coming_soon_dialog.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/course.dart';
import 'package:progresso/progresso.dart';

class CourseItem extends StatelessWidget {
  final CourseEntity course;
  const CourseItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //sample action to show the coming soon dialog
        if (course.progress == null) {
          ComingSoonDialog.show(
              context, 'Exciting News! 4 more exam board coming soon.');
        }
      },
      child: SizedBox(
        height: 340,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                height: 140,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: course.image,
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
                    Visibility(
                      visible: course.progress != null,
                      child: Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 18,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          clipBehavior: Clip.hardEdge,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ILColors.textSecondary.withOpacity(.6),
                          ),
                          child: Progresso(
                            progress: 0.3,
                            progressStrokeWidth: 10,
                            backgroundStrokeWidth: 10,
                            progressColor: ILColors.secondary,
                            backgroundColor: ILColors.dark,
                            progressStrokeCap: StrokeCap.round,
                            backgroundStrokeCap: StrokeCap.round,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Text(
                    course.name,
                    style: const TextStyle(
                      color: ILColors.textWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Visibility(
                  visible: course.progress != null,
                  child: const Text(
                    '35%',
                    style: TextStyle(
                      color: ILColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}