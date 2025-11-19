import 'package:blog_app/controllers/LogoutController.dart';
import 'package:blog_app/core/routs/routs.dart';
import 'package:blog_app/utils/app_image/app_image.dart';
import 'package:blog_app/widgets/Custom_Text.dart';
import 'package:blog_app/widgets/Custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/UserProfileController.dart';
import '../../../../widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final logoutController = Get.put(Logoutcontroller());
  final profileController = Get.put(ProfileController());

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
      body: Obx(() {
        if (profileController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.white));
        }
        final user = profileController.user.value;

        return RefreshIndicator(
          onRefresh: () => profileController.getUserProfile(),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
              child: Column(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(64.r),
                      child: user != null && user.name.isNotEmpty
                          ? CircleAvatar(
                              radius: 64.r,
                              backgroundColor: Colors.white24,
                              child: Text(
                                user.name[0].toUpperCase(),
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Image.asset(
                              AppImages.profileimage,
                              fit: BoxFit.cover,
                              height: 128.h,
                              width: 128.w,
                            ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomText(
                    text: user?.name ?? "Loading...",
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(text: user?.email ?? ""),
                  CustomText(text: user?.phone ?? ""),
                  SizedBox(height: 16.h),
                  //Edit field
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
                  //Password field
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
                        CustomText(
                          text: "Update Password",
                          color: Colors.white,
                        ),
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
                        logoutController.logout();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
