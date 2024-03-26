import 'package:equatable/equatable.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/sub_module.dart';

class CourseModule extends Equatable {
  final String id;
  final String name;
  final String title;
  final double progress;
  final List<SubModule> subModules;

  const CourseModule({
    required this.id,
    required this.name,
    required this.title,
    required this.progress,
    required this.subModules,
  });

  @override
  List<Object?> get props => [id, name, title, progress, subModules];
}
