import 'package:blog_app/core/routs/routs.dart';
import 'package:blog_app/servicess/api_servicess.dart';
import 'package:blog_app/utils/app_image/app_image.dart';
import 'package:blog_app/widgets/Custom_Text.dart';
import 'package:blog_app/widgets/Custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                AppImages.settingicon,
                height: 48.h,
                width: 48.w,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(64.r),
                child: Image.asset(
                  AppImages.profileimage,
                  fit: BoxFit.cover,
                  height: 128.h,
                  width: 128.w,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomText(
              text: "Ethan Carter",
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            CustomText(text: "ethan.carter@email.com"),
            CustomText(text: "Software Engineer"),
            SizedBox(height: 16.h),
            //Edit field=======================================
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.editProfilePage);
              },
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.editProfilePage);
                    },
                    icon: Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: SvgPicture.asset(
                        AppImages.editicon,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                  ),
                  CustomText(text: "Edit Profile", color: Colors.white),
                ],
              ),
            ),
            //Password field=======================================
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.updatePasswordPage);
              },
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.updatePasswordPage);
                    },
                    icon: Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: SvgPicture.asset(
                        AppImages.passwordicon,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                  ),
                  CustomText(text: "Update Password", color: Colors.white),
                ],
              ),
            ),
            SizedBox(height: 273.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                height: 40.h,
                backgroundColor: Colors.white12,
                text: "Logout",
                textColor: Colors.white,
                onPressed: () {
                 // ApiServicss.logout(token);
                  // Get.toNamed(Routes.loginpage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
