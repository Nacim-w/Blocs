import 'package:bloc_shop_app/Pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_shop_app/Pages/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_shop_app/Pages/sign_in/sign_in_controller.dart';
import 'package:bloc_shop_app/Pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirtPartyLogin(context),
                Center(
                    child: reusableText("Or use your email account to login")),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusableTextField(
                          "Enter your email address", "email", "user.png",
                          (value) {
                        context.read<SignInBloc>().add(EmailChanged(value));
                      }),
                      reusableText("Password"),
                      SizedBox(
                        height: 5.h,
                      ),
                      reusableTextField("Enter your Password", "password",
                          "lock.png", (value) {}),
                    ],
                  ),
                ),
                forgotPassword("forgot Password"),
                buildLoginAndRegButton("Login", "login", () {
                  //SignInController(context: context).handleSignIn("email");
                }),
                buildLoginAndRegButton("Register", "register", () {
                  Navigator.of(context).pushNamed("register");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
