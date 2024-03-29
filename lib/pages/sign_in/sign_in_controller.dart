import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/common/widgets/flutter_toast.dart';
import 'package:ulearning/pages/sign_in/bloc/login_blocs.dart';

import '../../common/apis/user_api.dart';
import '../../global.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBlocs>(context).state;
        final state = context.read<SignInBlocs>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill an email address");
          return;
        } else {
          print("email addess is ${emailAddress}");
        }

        if (password.isEmpty) {
          toastInfo(msg: "You need to fill an password");
          return;
        } else {
          print("password is ${password}");
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
          }
          var user = credential.user;
          if (user != null) {
            String? name = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = name;
            loginRequestEntity.email = email;
            loginRequestEntity.id = "1";
            loginRequestEntity.token = id;
            loginRequestEntity.created_at =
                DateFormat('yyyy-MM-dd').format(DateTime.now());
            // type 1 means email login
            loginRequestEntity.type = 1;
            print("photo url is ${photoUrl}");
            asyncPostAllData(loginRequestEntity);
            print("user exist");
            // Global.storageService
            //     .setString(AppConstant.STORAGE_USER_TOKEN_KEY, "logedIn");
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil('/application', (route) => false);
            //We got verified user from firebase
          } else {
            //we are getting error from firebase
            toastInfo(msg: "Currently you are not an user of this app!");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print("No user found for that email");
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            print("Wrong password provided for that user");
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            print("your email format is wrong");
            toastInfo(msg: "your email format is wrong");
          }
        }
      }
    } catch (e) {}
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    var result = await UserAPI.login(params: loginRequestEntity);
    if (result.status) {
      try {
        Global.storageService.setString(
            AppConstant.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        // Global.storageService
        //     .setString(AppConstant.STORAGE_USER_TOKEN_KEY, result.data!.accessToken!);
        Global.storageService
            .setString(AppConstant.STORAGE_USER_TOKEN_KEY, "logedIn");
        EasyLoading.dismiss();
      if(context.mounted){
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/application', (route) => false);
      }
      } catch (e) {
        print("Saving local storage error ${e.toString()}");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "Unknown Error!");
    }
  }
}
