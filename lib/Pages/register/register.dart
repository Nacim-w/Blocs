import 'package:bloc_shop_app/common/values/colors.dart';
import 'package:bloc_shop_app/pages/register/bloc/register_bloc.dart';
import 'package:bloc_shop_app/pages/register/bloc/register_events.dart';
import 'package:bloc_shop_app/pages/register/bloc/register_states.dart';
import 'package:bloc_shop_app/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterPage();
}

class _RegisterPage extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        color: AppColors.primaryBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primaryBackground,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: reusableText(
                          "Enter your details below & free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your user name", "username", "user",
                            (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UserNameEvent(value));
                        }),
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(PasswordEvent(value));
                        }),
                        reusableText("Re-enter Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField("Re-enter your password to confirm",
                            "re-password", "lock", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(RePasswordEvent(value));
                        }),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: 260.w,
                          child: Text(
                            "By creating an account you have to agree with our them & condication.",
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        buildLogInAndRegButton("Sign Up", "login", () {
                          RegisterController(context: context)
                              .handleEmailRegister();
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
