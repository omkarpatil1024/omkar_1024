import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/user.dart';
import '../../global.dart';

class HomeController {
  final BuildContext context;

  HomeController({required this.context});

  UserItem? userProfile = Global.storageService.getUserProfile();

  Future<void> init() async {
    //make sure user has loged in application
    if(Global.storageService.getUserToken().isNotEmpty){
      var result = await CourseApi.courseList();
      if (result.status!=null) {
        if(context.mounted){
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
        }
      } else {
        print(result.status);
      }
    }else{
      print("User has already loggedout");
    }
  }
}
