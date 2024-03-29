import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

import '../../global.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body:
            BlocBuilder<WelcomeBlocs, WelcomeStates>(builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 45.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvents());
                  },
                  children: [
                    _Page(
                        1,
                        context,
                        "next",
                        "First See Learning",
                        "set the whole stage for tailored learning pathways",
                        "assets/images/reading.png"),
                    _Page(
                        2,
                        context,
                        "next",
                        "Connect With EveryOne",
                        "Always keep in touch with your teacher and friends",
                        "assets/images/boy.png"),
                    _Page(
                        3,
                        context,
                        "Get Started",
                        "Always Facinating Lerning",
                        "Anywhere, Anytime.The time is at your discriation so study whenever you want ",
                        "assets/images/man.png"),
                  ],
                ),
                Positioned(
                  bottom: 10.h,
                  child: DotsIndicator(
                    position: state.page,
                    decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        size: Size.square(8.0),
                        activeSize: Size(18, 8),
                        activeColor: AppColors.primaryElement,
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _Page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Container(
      margin: EdgeInsets.only(top: 100.h),
      child: Column(
        children: [
          SizedBox(
            width: 345.w,
            height: 345.h,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Text(
              title,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 24.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: SizedBox(
              width: 375.w,
              child: Text(
                subTitle,
                style: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (index < 3) {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn);
              } else {
                Global.storageService
                    .setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
                print(Global.storageService.getDeviceFirsrOpen());
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/sign_in", (route) => false);
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage()));
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 100.h, right: 25.w, left: 25.w),
              width: 325.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 5))
                  ]),
              child: Center(
                  child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp),
              )),
            ),
          )
        ],
      ),
    );
  }
}
