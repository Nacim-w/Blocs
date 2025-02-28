import 'package:bloc_shop_app/common/values/colors.dart';
import 'package:bloc_shop_app/pages/home/bloc/home_page_blocs.dart';
import 'package:bloc_shop_app/pages/home/bloc/home_page_events.dart';
import 'package:bloc_shop_app/pages/home/bloc/home_page_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 15.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/person.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.h),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: "Search your course",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
                autocorrect: false,
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      ),
    ],
  );
}

Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print(value);
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            slidersContainer(path: "assets/icons/Art.png"),
            slidersContainer(path: "assets/icons/Image(1).png"),
            slidersContainer(path: "assets/icons/Image(2).png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: Size.square(5.0),
            activeSize: Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget slidersContainer({String path = "assets/icons/Art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course"),
            GestureDetector(
              child: reusableText("See all",
                  color: AppColors.primaryThreeElementText, fontSize: 10),
            ),
          ],
        ),
      ),
      Container(
          margin: EdgeInsets.only(top: 20.w),
          child: Row(
            children: [
              reusableMenuText("All"),
              reusableMenuText("Populer",
                  textColor: AppColors.primaryThreeElementText,
                  backgroundColor: AppColors.primaryBackground),
              reusableMenuText("Newest",
                  textColor: AppColors.primaryThreeElementText,
                  backgroundColor: AppColors.primaryBackground),
            ],
          )),
    ],
  );
}

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
        color: color, fontWeight: FontWeight.bold, fontSize: fontSize.sp),
  );
}

Widget reusableMenuText(String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backgroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.h),
      border: Border.all(color: backgroundColor),
    ),
    padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
    child: reusableText(menuText,
        color: textColor, fontWeight: FontWeight.normal, fontSize: 11),
  );
}

Widget courseGrid() {
  return Container(
    padding: EdgeInsets.all(12.w),
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/icons/Image(1).png"),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Best course for IT and Engineering",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp),
        ),
        SizedBox(height: 5.h),
        Text(
          "Flutter best course",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.normal,
              fontSize: 8.sp),
        ),
      ],
    ),
  );
}
