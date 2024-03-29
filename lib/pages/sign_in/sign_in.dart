import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/sign_in/bloc/login_blocs.dart';
import 'package:ulearning/pages/sign_in/bloc/login_events.dart';
import 'package:ulearning/pages/sign_in/bloc/login_states.dart';
import 'package:ulearning/pages/sign_in/sign_in_controller.dart';
import '../comman_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInStates>(
      builder: (BuildContext context, SignInStates state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: CustomAppBar("Log In"),
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildThirdPartyLogin(context),
                      Center(
                          child: reUsableText(
                              "Or use your email account to login")),
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reUsableText("E-mail"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                                "Enter your email address", "email", "user",
                                (value) {
                              context
                                  .read<SignInBlocs>()
                                  .add(EmailEvent(value));
                            }),
                            reUsableText("Password"),
                            SizedBox(
                              height: 5.h,
                            ),
                            buildTextField(
                                "Enter your password", "password", "lock",
                                (value) {
                              context
                                  .read<SignInBlocs>()
                                  .add(PasswordEvent(value));
                            }),
                            forgotPassword(),
                            SizedBox(
                              height: 70.h,
                            ),
                            buildLoginAndRegButton("Log In", "login", () {
                              SignInController(context: context)
                                  .handleSignIn("email");
                            }),
                            buildLoginAndRegButton("Sign Up", "Sign Up", () {
                              Navigator.of(context).pushNamed("/register");
                            })
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

//We need context to accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 40.h),
      padding: EdgeInsets.only(left: 50.w, right: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          reUsableIcons("google"),
          reUsableIcons("apple"),
          reUsableIcons("facebook")
        ],
      ),
    ),
  );
}

Widget reUsableIcons(String icon) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.h,
      width: 40.w,
      child: Image.asset("assets/icons/${icon}.png"),
    ),
  );
}

Widget forgotPassword() {
  return Container(
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot Password?",
          style: TextStyle(
              color: AppColors.primaryText,
              decoration: TextDecoration.underline,
              fontSize: 12.sp,
              decorationColor: AppColors.primaryText),
        ),
      ));
}
