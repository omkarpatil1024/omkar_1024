import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_events.dart';
import 'package:ulearning/pages/register/bloc/register_states.dart';
import 'package:ulearning/pages/register/register_controller.dart';

import '../comman_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
      builder: (BuildContext context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: CustomAppBar("Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                          child: reUsableText(
                              "Enter Your Details Below & Free Sign Up")),
                      Container(
                        margin: EdgeInsets.only(top: 60.h),
                        padding: EdgeInsets.only(left: 25.w, right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reUsableText("User Name"),
                            buildTextField(
                                "Enter your user name", "username", "user",
                                (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(UserNameEvent(value));
                            }),
                            reUsableText("E-mail"),
                            buildTextField(
                                "Enter your email address", "email", "user",
                                (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(EmailEvent(value));
                            }),
                            reUsableText("Password"),
                            buildTextField(
                                "Enter your password", "password", "lock",
                                (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(PasswordEvent(value));
                            }),
                            reUsableText("Confirm Password"),
                            buildTextField("Enter your confirm password",
                                "password", "lock", (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(RePasswordEvent(value));
                            }),
                            reUsableText(
                                "By creating an account you have to agree with our terms and conditions"),
                            buildLoginAndRegButton("Sign Up", "login", () {
                              RegisterController(context: context)
                                  .handleEmailRegistration();
                              //  SignInController(context: context).handleSignIn("email");
                            }),
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
