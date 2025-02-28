import 'package:bloc_shop_app/common/values/colors.dart';
import 'package:bloc_shop_app/pages/home/bloc/home_page_blocs.dart';
import 'package:bloc_shop_app/pages/home/bloc/home_page_states.dart';
import 'package:bloc_shop_app/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homePageText("hello", color: AppColors.primaryThreeElementText),
                homePageText("Nacim", top: 5),
                SizedBox(
                  height: 20.h,
                ),
                searchView(),
                SizedBox(
                  height: 20.h,
                ),
                slidersView(context, state),
              ],
            ),
          );
        },
      ),
    );
  }
}
