import 'package:equatable/equatable.dart';
import 'package:inspired_learning_ai/core/helper/fake_course_data.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/course_module.dart';

class CourseEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String description;
  final List<CourseModule> modules;
  final String courseTotalHours;
  final double progress;

  const CourseEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    this.courseTotalHours = '7 hours 31 mintues',
    this.modules = fakeCourseData,
    this.progress = 0.0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        description,
        modules,
        courseTotalHours,
        progress,
      ];
}
