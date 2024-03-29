import 'package:ulearning/common/entities/course.dart';

class CourseDetailsStates {
  const CourseDetailsStates({this.courseItem});

  final CourseItem? courseItem;

  CourseDetailsStates copyWith({CourseItem? courseItem}) {
    return CourseDetailsStates(courseItem: courseItem ?? this.courseItem);
  }
}
