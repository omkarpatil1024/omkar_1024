import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';
import 'package:ulearning/pages/home/home_controller.dart';

import 'home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late HomeController _homeController;
   late UserItem? userProfile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile=HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppbar(userProfile!.avatar.toString()),
            body: BlocBuilder<HomePageBlocs, HomePageStates>(
              builder: (context, state) {
                if(state.courseItem.isEmpty)
                  {
                    HomeController(context: context).init();
                  }else{
                  print("...........state.course is not empty.........");
                }
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
                  child: CustomScrollView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    slivers: [
                      SliverToBoxAdapter(
                        child: homePageText("Hello,  ",
                            color: AppColors.primaryThreeElementText, top: 20),
                      ),
                      SliverToBoxAdapter(
                        child: homePageText(
                            "${userProfile!.name!}",
                            color: AppColors.primaryText,
                            top: 3),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(top: 20.h),
                      ),
                      SliverToBoxAdapter(
                        child: searchBar(),
                      ),
                      SliverToBoxAdapter(
                        child: slidersView(context, state),
                      ),
                      SliverToBoxAdapter(
                        child: menuView(),
                      ),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 0.w)),
                      SliverGrid(
                          delegate: SliverChildBuilderDelegate(childCount: state.courseItem.length,
                              (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(AppRoutes.COURSE_DETAILS,arguments: {"id":state.courseItem.elementAt(index).id});
                              },
                              child: courseGridView(state.courseItem[index]),
                            );
                          }),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  childAspectRatio: 1.6))
                    ],
                  ),
                );
              },
            ),
          )
        : Container();
  }
}
