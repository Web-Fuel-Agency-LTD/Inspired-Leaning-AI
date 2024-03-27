import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/core/utils/constants/image_strings.dart';

class CourseComplete extends StatelessWidget {
  const CourseComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ILColors.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 34,
                        height: 34,
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: ILColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: ILColors.textWhite,
                          size: 20,
                        ),
                      ),
                    ),
                    Row(
                      children: [1, 2, 3, 4, 5, 6]
                          .map((e) => Container(
                                margin: const EdgeInsets.only(right: 4),
                                height: 32,
                                width: 32,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ILColors.textSecondary,
                                ),
                              ))
                          .toList(),
                    ),
                    Row(
                      children: [
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(3.1415926535),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: ILColors.primary,
                            size: 44,
                          ),
                        ),
                        const Icon(
                          Icons.play_arrow_rounded,
                          color: ILColors.primary,
                          size: 44,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: ILImages.courseComplete,
                      imageBuilder: (context, imageProvider) => SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              right: 16,
                              top: 0,
                              bottom: 0,
                              left: 80,
                              child: Transform.rotate(
                                angle: 25 * (3.1415926535 / 180),
                                child: Image(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      placeholder: (context, url) => const SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    ),
                    const Positioned(
                      bottom: -8,
                      child: Text(
                        'Amazing!',
                        style: TextStyle(
                          color: ILColors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Center(
                  child: Text(
                    "You've completed",
                    style: TextStyle(
                      color: ILColors.textWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    "Module 5: \nClimate Change",
                    style: TextStyle(
                      color: ILColors.textWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ILColors.accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Revise this topic',
                          style: TextStyle(
                            color: ILColors.textWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ILColors.accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Teach Me Some More',
                          style: TextStyle(
                            color: ILColors.textWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC857),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Move to Next Topic',
                          style: TextStyle(
                            color: ILColors.dark,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ILColors.dark,
                        size: 16,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'UP NEXT',
                    style: TextStyle(
                      color: ILColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Global Resources and Consumption',
                    style: TextStyle(
                      color: ILColors.textWhite,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CachedNetworkImage(
                  imageUrl: ILImages.courseCompleteHuman,
                  placeholder: (context, url) => const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  imageBuilder: (context, imageProvider) => SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
