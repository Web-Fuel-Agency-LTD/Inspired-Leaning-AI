import 'package:equatable/equatable.dart';

class ExamBoardEntity extends Equatable {
  final String id;
  final String name;
  final String image;

  const ExamBoardEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object> get props => [id, name, image];
}
