import 'package:bloc_shop_app/common/widgets/flutter_toast.dart';
import 'package:bloc_shop_app/pages/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.username;
    String email = state.email;
    String password = state.password;
    String repassword = state.repassword;

    if (userName.isEmpty) {
      toastInfo(msg: "UserName not empty!");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email name can not be empty!");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password name can not be empty!");
      return;
    }
    if (password != repassword) {
      toastInfo(msg: "The two passwords do not match!");
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential);
      await credential.user?.sendEmailVerification();
      await credential.user?.updateDisplayName(userName);
      toastInfo(
          msg:
              "An email has been sent to your registered email. To activate your account, please open the link from the email.");
      Navigator.of(context).pop();
        } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        toastInfo(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        toastInfo(msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }
}
