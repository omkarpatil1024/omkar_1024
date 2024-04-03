import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/course.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_events.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';

import '../../common/widgets/base_text.dart';

AppBar buildAppbar(String avatar) {
  return AppBar(
    backgroundColor: AppColors.primaryBackground,
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(avatar))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color? color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(fontSize: 24.sp, color: color, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchBar() {
  return Row(children: [
    Container(
      height: 40.h,
      width: 280.w,
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            width: 16.w,
            height: 16.h,
            child: Image.asset("assets/icons/search.png"),
          ),
          Container(
            width: 240.w,
            height: 40.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 4, 0, 6),
                  hintText: "search your course",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle:
                      TextStyle(color: AppColors.primarySecondaryElementText)),
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Avanir"),
              autocorrect: false,
              obscureText: false,
            ),
          )
        ],
      ),
    ),
    GestureDetector(
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.r)),
            border: Border.all(color: AppColors.primaryElement)),
        child: Image.asset("assets/icons/options.png"),
      ),
    )
  ]);
}

Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print(value.toString());
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _sliderContainer(path: "assets/icons/Image(2).png"),
            _sliderContainer(path: "assets/icons/Image(1).png"),
            _sliderContainer(path: "assets/icons/Image(2).png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index!.toInt(),
          decorator: DotsDecorator(
              size: Size.square(4.0),
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              activeSize: Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

//sliders widgets

Widget _sliderContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill)),
  );
}

//for menu button reusablebuttons
Widget menuButtons(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color bgColor = AppColors.primaryBackground}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: AppColors.primaryElement)),
    child: reusbleText(menuText,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
    padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 15.w, right: 15.w),
  );
}

//menuview for showing items
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusbleText("Choose your course"),
            reusbleText("See All",
                color: AppColors.primaryThreeElementText, fontSize: 10)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            menuButtons("All", bgColor: AppColors.primaryElement),
            menuButtons("Popular",
                textColor: AppColors.primaryThreeElementText),
            menuButtons("Newest", textColor: AppColors.primaryThreeElementText)
          ],
        ),
      )
    ],
  );
}

Widget courseGridView(CourseItem item) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image:  DecorationImage(
            image: NetworkImage(item.thumbnail!), fit: BoxFit.fill)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name??"",
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp),
          maxLines: 1,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.left,
          softWrap: false,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          item.description??"",
          style: TextStyle(
              color: AppColors.primaryFourElementText,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp),
          maxLines: 1,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.left,
          softWrap: false,
        )
      ],
    ),
  );
}
