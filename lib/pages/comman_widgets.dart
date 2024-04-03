import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar CustomAppBar(text) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    elevation: 0,
    centerTitle: true,
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
    ),
  );
}

Widget reUsableText(String text) {
  return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontWeight: FontWeight.normal,
            fontSize: 14.sp),
      ));
}

Widget  buildTextField(String hintText, String text, String iconName,
    void Function(String value)? func) {
  return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            width: 16.w,
            height: 16.h,
            child: Image.asset("assets/icons/${iconName}.png"),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) => func!(value),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: const TextStyle(
                      color: AppColors.primarySecondaryElementText)),
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Avanir"),
              autocorrect: false,
              obscureText: text == "password" ? true : false,
            ),
          )
        ],
      ));
}

Widget buildLoginAndRegButton(
    String buttonName, String buttontype, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(top: buttontype == "login" ? 20.h : 10.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: buttontype == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
              color: buttontype == "login"
                  ? Colors.transparent
                  : AppColors.primaryElementText),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 2,
                color: Colors.grey.withOpacity(0.5))
          ]),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttontype == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText),
      )),
    ),
  );
}
