import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/widgets/base_text.dart';

AppBar buildAppBar() {
  return AppBar(
    title: reusble_Text("Course Detail"),
  );
}

Widget thumbNail() {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration:  BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage("assets/icons/Image(2).png"))),
  );
}

Widget menuView() {
  return SizedBox(
    width: 325.w,
    // height: 20.h,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryElement),
                borderRadius: BorderRadius.circular(7.w),
                color: AppColors.primaryElement),
            child: reusble_Text("Author Page",
                color: AppColors.primaryElementText,
                fontWeight: FontWeight.normal,
                fontSize: 10.sp),
          ),
        ),
        _iconAndNum("assets/icons/people.png", 0),
        _iconAndNum("assets/icons/star.png", 0),
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        5.horizontalSpace,
        reusble_Text(num.toString(),
            color: AppColors.primaryThreeElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal)
      ],
    ),
  );
}

Widget goBuyButton(String name) {
  return Container(
      padding: EdgeInsets.only(top: 13.h),
      width: 330.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: AppColors.primaryElement)),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: AppColors.primaryElementText),
      ));
}

Widget descriptionText(String description){
  return   reusble_Text(
      description,
      color: AppColors.primaryThreeElementText,
      fontWeight: FontWeight.normal,
      fontSize: 12.sp);
}

Widget courseSummury(){
  return reusble_Text("The Course Includes",fontSize: 14.sp);
}


var imageInfo = <String, String>{
  "36 Hours Video": "video_detail.png",
  "Total 30 Lessons": "file_detail.png",
  "67 Downloadable Resources": "download_detail.png",
};

Widget buitListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(imageInfo.length, (index) =>  GestureDetector(
        onTap:(){

        },
        child: Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.primaryElement),
                child: Image.asset("assets/icons/${imageInfo.values.elementAt(index)}",width: 30.w,
                  height: 30.h,),
              ),
              SizedBox(
                width: 15.w,
              ),
              reusble_Text(imageInfo.keys.elementAt(index),fontSize: 11.sp,fontWeight: FontWeight.bold),
            ],
          ),
        ),
      ))
    ],
  );
}