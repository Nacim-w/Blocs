import 'package:bloc_shop_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_shop_app/pages/welcome/bloc/welcome_event.dart';
import 'package:bloc_shop_app/pages/welcome/bloc/welcome_state.dart';
import 'package:bloc_shop_app/common/values/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 50.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body:
          BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                },
                children: [
                  _page(
                      1,
                      context,
                      "Next",
                      "First see learning",
                      "Forget about a for of paper all knowledge in one learning!",
                      "assets/images/reading.png"),
                  _page(
                      2,
                      context,
                      "Next",
                      "Connect With Everyone",
                      "Always keep in touch with your tutors & friends, let's get connected!",
                      "assets/images/boy.png"),
                  _page(
                      3,
                      context,
                      "Get Started",
                      "Always Facscinated Learning",
                      "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                      "assets/images/man.png")
                ],
              ),
              Positioned(
                bottom: 100.h,
                child: DotsIndicator(
                  position: state.page.toDouble(),
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    color: AppColors.primaryThreeElementText,
                    activeColor: AppColors.primaryElement,
                    size: const Size.square(8.0),
                    activeSize: const Size(12.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ],
          ),
        );
      })),
    );
  }
}
