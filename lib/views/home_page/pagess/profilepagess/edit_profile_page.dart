import 'package:blog_app/widgets/Custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../controllers/UpdateProfileController.dart';
import '../../../../utils/app_image/app_image.dart';
import '../../../../widgets/Custom_Text.dart';
import '../../../../widgets/Custom_appbar.dart';
import '../../../../widgets/custom_button.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  Updateprofilecontroller controller = Get.put(Updateprofilecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: "Edit Profile", leading: CustomBackButton()),
      backgroundColor: Colors.black,
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(64.r),
                    child: controller.editNameController.text.isEmpty
                        ? Image.asset(
                            AppImages.editprofileimage,
                            fit: BoxFit.cover,
                            height: 128.h,
                            width: 128.w,
                          )
                        : CircleAvatar(
                            radius: 64.r,
                            backgroundColor: Colors.white24,
                            child: Text(
                              controller.editNameController.text[0]
                                  .toUpperCase(),
                              style: TextStyle(
                                fontSize: 40.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: CustomText(
                    text: controller.editNameController.text.isEmpty
                        ? "Sophia Carter"
                        : controller.editNameController.text,
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: CustomText(text: controller.editPhoneController.text),
                ),
                SizedBox(height: 16.h),
                //Name field=======================================
                CustomText(text: "Display Name", color: Colors.white),
                SizedBox(height: 3.h),
                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white12,
                  ),
                  child: TextFormField(
                    controller: controller.editNameController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                //Phone field=======================================
                CustomText(text: "Phone", color: Colors.white),
                SizedBox(height: 3.h),
                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white12,
                  ),
                  child: TextFormField(
                    controller: controller.editPhoneController,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                //bio field=======================================
                CustomText(text: "Bio", color: Colors.white),
                SizedBox(height: 3.h),
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white12,
                  ),
                  child: TextFormField(
                    controller: controller.bioController,
                    cursorColor: Colors.white,
                    minLines: 10,
                    maxLines: 10,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    ),
                  ),
                ),
                SizedBox(height: 76.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomButton(
                    text: controller.isLoading.value
                        ? "Saving..."
                        : "Save Changes",
                    onPressed: () {
                      if (!controller.isLoading.value) {
                        controller.updateUserProfile();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
