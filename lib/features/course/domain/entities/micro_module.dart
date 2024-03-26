import 'package:equatable/equatable.dart';

class MicroModule extends Equatable {
  final String id;
  final String name;
  final String title;
  final double progress;

  const MicroModule({
    required this.id,
    required this.name,
    required this.title,
    required this.progress,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        title,
        progress,
      ];
}
