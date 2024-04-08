import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/course/widgets/course_details_widgets.dart';

import '../../common/widgets/base_text.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  late var id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
              child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thumbNail(),
                  15.verticalSpace,
                  menuView(),
                  15.verticalSpace,
                  reusble_Text("Course Description"),
                  15.verticalSpace,
                  descriptionText("It's difficult to reproduce because I don't have access to your folder structure, so you will have to work at getting the exact path to your zip file correct for you."),
                  15.verticalSpace,
                  goBuyButton("Go Buy"),
                  15.verticalSpace,
                  courseSummury(),
                  buitListView(context),
                  reusble_Text("Lesson List"),
                ],
              ),
            )
          ])),
        ),
      ),
    );
  }
}
