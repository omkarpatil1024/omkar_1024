import 'package:ulearning/common/util/http_util.dart';

import '../entities/course.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().get('get-courses');
    return CourseListResponseEntity.fromJson(response);
  }
}
