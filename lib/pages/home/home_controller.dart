import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/user.dart';
import '../../global.dart';

class HomeController {
  late  BuildContext context;

  UserItem? get userProfile => Global.storageService.getUserProfile();

  static final HomeController _singleTon = HomeController._internal();

  HomeController._internal();

  //this is factory contstructor
  // the factory con make sure you have original only one instance
  factory HomeController({required BuildContext context}) {
    _singleTon.context = context;
    return _singleTon;
  }

  Future<void> init() async {
    //make sure user has loged in application
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseApi.courseList();
      print('the result is ${result.data![0].description}');
      if (result.status != null) {
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
      } else {
        print(result.status);
      }
    } else {
      print("User has already loggedout");
    }
  }
}
