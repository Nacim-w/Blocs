import 'package:bloc_shop_app/common/values/constant.dart';
import 'package:bloc_shop_app/global.dart';
import 'package:bloc_shop_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_shop_app/common/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> handleSignIn(String type, context) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "Email is empty");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Password is empty");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "User does not exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "Email is not verified");
            return;
          }
          var user = credential.user;
          if (user != null) {
            toastInfo(msg: "User Exists");
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            // TODO: how to resolve this problem below
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (_) => false);
            return;
          }
        } on FirebaseAuthException catch (e) {
          debugPrint(e.code);
          if (e.code == 'invalid-credential') {
            toastInfo(msg: "Invalid credential");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user");
            return;
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Invalid email format");
            return;
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
