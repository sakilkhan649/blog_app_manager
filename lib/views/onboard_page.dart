import 'package:blog_app/core/routs/routs.dart';
import 'package:blog_app/utils/app_image/app_image.dart';
import 'package:blog_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/Custom_Text.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset(
            AppImages.onboardimage,
            height: 320.h,
            width: 390.w,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 16.w,
              vertical: 20.w,
            ),
            child: Column(
              children: [
                CustomText(
                  text: "Welcome to Your Personal",
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                CustomText(
                  text: "Blog Space",
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Discover articles,save your favorites,and engage",
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
                CustomText(
                  text: "with the community.",
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
                SizedBox(height: 266.h),
                CustomButton(
                  text: "Get Started",
                  onPressed: () {
                    Get.toNamed(Routes.loginpage);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
