import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/components/coming_soon_dialog.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/features/course/presentation/screens/course_screen.dart';
import 'package:inspired_learning_ai/features/main/domain/entities/sub_categories.dart';

class SubCategoryItem extends StatelessWidget {
  final SubCategoryEntity subCategory;
  const SubCategoryItem({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: GestureDetector(
        onTap: () {
          // sample action to show the showdialog
          if (subCategory.name == 'Mandatory') {
            ComingSoonDialog.show(
                context, 'Exciting News! 4 more exam board coming soon.');
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CourseScreen(courseName: subCategory.name)));
          }
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: size.width,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ILColors.primary,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 68,
                child: CachedNetworkImage(
                  imageUrl: subCategory.image,
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subCategory.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            const Text(
                              '4 Courses',
                              style: TextStyle(
                                color: ILColors.light,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 41,
                          height: 41,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: ILColors.accent,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )),
                    ],
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
