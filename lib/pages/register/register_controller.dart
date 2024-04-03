import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/widgets/flutter_toast.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegistration() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "UserName can not be empty");
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can not be empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "your Password confirmation is wrong");
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(credential);
      var user = credential.user;
      print(user);
      if (user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "https://cdn-icons-png.flaticon.com/512/2342/2342004.png";
        await credential.user?.updatePhotoURL(photoUrl);
        toastInfo(msg: "An email has been sent to your registered email. To activate is please check your email box and click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "the password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "the email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "your email id is invalid");
      }
    }
  }
}
