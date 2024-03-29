//unify blocprovider ,routes and pages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/application/application_page.dart';
import 'package:ulearning/pages/application/bloc/apps_blocs.dart';
import 'package:ulearning/pages/course/bloc/course_details_blocs.dart';
import 'package:ulearning/pages/course/course_details.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:ulearning/pages/profile/settings/settings_page.dart';

import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/bloc/login_blocs.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/welcome.dart';

import '../../global.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBlocs(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBlocs(),
          )),
      PageEntity(
          route: AppRoutes.AAPPLICATION,
          page: ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBlocs(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBlocs(),
          )),
      PageEntity(
          route: AppRoutes.COURSE_DETAILS,
          page: CourseDetails(),
          bloc: BlocProvider(
            create: (_) => CourseDatailsBloc(),
          )),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var bloc in routes()) {
      blocProvider.add(bloc.bloc);
    }
    return blocProvider;
  }

  //  a model that covers entire screen as we click navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // check for route name matchies when navigator gets triggers
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        print("first time login");
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirsrOpen();
        print("valid route name is ${settings.name}");

        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLogedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => ApplicationPage(), settings: settings);
          }
          print("Second time login");
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("Invalid route name is ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, required this.bloc});
}
