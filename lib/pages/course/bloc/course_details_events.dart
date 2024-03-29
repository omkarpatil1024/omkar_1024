import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ulearning/common/entities/course.dart';

abstract class CourseDetailsEvent{
  const CourseDetailsEvent();
}

class TriggerCourseDatail extends CourseDetailsEvent{
  const TriggerCourseDatail(this.courseItem):super();
  final CourseItem courseItem;
}