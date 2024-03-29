import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/course/bloc/course_details_events.dart';
import 'package:ulearning/pages/course/bloc/course_details_states.dart';

class CourseDatailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsStates> {
  CourseDatailsBloc() : super(const CourseDetailsStates()) {
    on<TriggerCourseDatail>(_triggerCourseDetails);
  }

  void _triggerCourseDetails(
      TriggerCourseDatail event, Emitter<CourseDetailsStates> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
