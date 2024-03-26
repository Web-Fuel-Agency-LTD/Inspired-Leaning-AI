import 'package:equatable/equatable.dart';
import 'package:inspired_learning_ai/features/course/domain/entities/micro_module.dart';

class SubModule extends Equatable {
  final String id;
  final String name;
  final String title;
  final double progress;
  final List<MicroModule> microModules;

  const SubModule({
    required this.id,
    required this.name,
    required this.title,
    required this.progress,
    required this.microModules,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        title,
        progress,
        microModules,
      ];
}
