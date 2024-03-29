import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/profile/profile_page.dart';

import '../../common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Course"),
    ),
    Center(
      child: Text("Chat"),
    ),
    const ProfilePage()
  ];
  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
      label: "home",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/home.png"),
      ),
      activeIcon: SizedBox(
          height: 15.h,
          width: 15.w,
          child: Image.asset(
            "assets/icons/home.png",
            color: AppColors.primaryElement,
          ))),
  BottomNavigationBarItem(
      label: "search",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/search2.png"),
      ),
      activeIcon: SizedBox(
          height: 15.h,
          width: 15.w,
          child: Image.asset(
            "assets/icons/search2.png",
            color: AppColors.primaryElement,
          ))),
  BottomNavigationBarItem(
      label: "Course",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/play-circle1.png"),
      ),
      activeIcon: SizedBox(
          height: 15.h,
          width: 15.w,
          child: Image.asset(
            "assets/icons/play-circle1.png",
            color: AppColors.primaryElement,
          ))),
  BottomNavigationBarItem(
      label: "Chat",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/message-circle.png"),
      ),
      activeIcon: SizedBox(
          height: 15.h,
          width: 15.w,
          child: Image.asset(
            "assets/icons/message-circle.png",
            color: AppColors.primaryElement,
          ))),
  BottomNavigationBarItem(
      label: "Profile",
      icon: SizedBox(
        height: 15.h,
        width: 15.w,
        child: Image.asset("assets/icons/person.png"),
      ),
      activeIcon: SizedBox(
          height: 15.h,
          width: 15.w,
          child: Image.asset(
            "assets/icons/person.png",
            color: AppColors.primaryElement,
          )))
];
