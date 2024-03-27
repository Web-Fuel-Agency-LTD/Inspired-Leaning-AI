import 'package:flutter/material.dart';
import 'package:inspired_learning_ai/core/utils/constants/colors.dart';
import 'package:inspired_learning_ai/core/utils/constants/image_strings.dart';
import 'package:inspired_learning_ai/core/utils/constants/text_strings.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/course.dart';
import 'package:inspired_learning_ai/features/course/presentation/widgets/course_item.dart';

class CourseScreen extends StatelessWidget {
  final String courseName;
  const CourseScreen({super.key, required this.courseName});

  @override
  Widget build(BuildContext context) {
    //TODO: connect to the backend
    //TODO: replace the sample data with the actual data from the backend
    final courses = [
      const CourseEntity(
        id: 'id',
        name: 'History',
        image: ILImages.course,
        description: ILText.courseDescription,
      ),
      const CourseEntity(
        id: 'id',
        name: 'European Literature',
        image: ILImages.course1,
        description: ILText.courseDescription,
      ),
      const CourseEntity(
        id: 'id',
        name: 'Geography',
        image: ILImages.course2,
        progress: 4.2,
        description: ILText.courseDescription,
      ),
      const CourseEntity(
        id: 'id',
        name: 'Religious Studies',
        image: ILImages.course3,
        description: ILText.courseDescription,
      ),
      const CourseEntity(
        id: 'id',
        name: 'Economics',
        image: ILImages.course4,
        description: ILText.courseDescription,
      ),
      const CourseEntity(
        id: 'id',
        name: 'Geology',
        image: ILImages.course5,
        description: ILText.courseDescription,
      ),
      const CourseEntity(
        id: 'id',
        name: 'Pyschology',
        image: ILImages.course6,
        description: ILText.courseDescription,
      ),
      const CourseEntity(
        id: 'id',
        name: 'Sociology',
        image: ILImages.course7,
        description: ILText.courseDescription,
      ),
    ];

    return Scaffold(
      backgroundColor: ILColors.dark,
      appBar: AppBar(
        title: Text(
          courseName,
          style: const TextStyle(color: Colors.white),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Courses',
                style: TextStyle(color: ILColors.textSecondary, fontSize: 22)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 22,
              mainAxisSpacing: 16,
              // childAspectRatio: 1.2,
              children:
                  courses.map((course) => CourseItem(course: course)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
