class CourseEntity {
  final String id;
  final String name;
  final String image;
  final double? progress;

  CourseEntity({
    required this.id,
    required this.name,
    required this.image,
    this.progress,
  });
}
