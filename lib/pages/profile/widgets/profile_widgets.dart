import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';

import '../../../common/widgets/base_text.dart';

AppBar buildAppBar() {
  return AppBar(
      title: Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset("assets/icons/menu.png"),
        ),
        reusble_Text("Profile"),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset("assets/icons/more-vertical.png"),
        ),
      ],
    ),
  ));
}

Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
            image: AssetImage("assets/icons/headpic.png"))),
    child: Container(
      padding: EdgeInsets.only(right: 6.w),
      alignment: Alignment.bottomRight,
      child: Image(
        width: 25.w,
        height: 25.h,
        image: const AssetImage("assets/icons/edit_3.png"),
      ),
    ),
  );
}

var imageInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders":"cube.png"
};

Widget buitListView(BuildContext context) {
  return Column(
    children: [
     ...List.generate(imageInfo.length, (index) =>  GestureDetector(
       onTap:(){
         Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
       },
       child: Container(
         margin: EdgeInsets.only(bottom: 15.h),
         child: Row(
           children: [
             Container(
               padding: EdgeInsets.all(7.0),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10.r),
                   color: AppColors.primaryElement),
               width: 40.w,
               height: 40.h,
               child: Image.asset("assets/icons/${imageInfo.values.elementAt(index)}"),
             ),
             SizedBox(
               width: 15.w,
             ),
             reusble_Text(imageInfo.keys.elementAt(index)),
           ],
         ),
       ),
     ))
    ],
  );
}
