import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../widgets/Custom_Text.dart';
import '../../../../widgets/Custom_appbar.dart';
import '../../../../widgets/Custom_back_button.dart';
import '../../../../widgets/Custom_textField.dart';
import '../../../../widgets/custom_button.dart';

class UpdatePasswordPage extends StatelessWidget {
  UpdatePasswordPage({super.key});

  final _formkey = GlobalKey<FormState>();

  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isConfirmnewPasswordVisible = false.obs;
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmnewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(
          title: "Update Password",
          leading: CustomBackButton(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),

                CustomText(text: "Current Password", fontSize: 16, color: Colors.white),
                SizedBox(height: 5.h),

                Obx(
                  () => Customtextfield(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        isPasswordVisible.value = !isPasswordVisible.value;
                      },
                    ),
                    controller: currentPasswordController,
                    hintText: "Enter  your current password",
                    obscureText: !isPasswordVisible.value,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter  your current password";
                      }
                      if (!AppString.passRegexp.hasMatch(value)) {
                        return "Invalid password";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 15.h),
                CustomText(
                  text: "New Password",
                  fontSize: 16,
                  color: Colors.white,
                ),
                SizedBox(height: 5.h),
                Obx(
                  () => Customtextfield(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        isConfirmPasswordVisible.value =
                            !isConfirmPasswordVisible.value;
                      },
                    ),
                    controller: confirmnewPasswordController,
                    hintText: "Enter  your new password",
                    obscureText: !isConfirmPasswordVisible.value,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter  your new password";
                      }
                      if (!AppString.passRegexp.hasMatch(value)) {
                        return "Invalid password";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 15.h),
                CustomText(
                  text: "Confirm New Password",
                  fontSize: 16,
                  color: Colors.white,
                ),
                SizedBox(height: 5.h),
                Obx(
                      () => Customtextfield(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmnewPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        isConfirmnewPasswordVisible.value =
                        !isConfirmnewPasswordVisible.value;
                      },
                    ),
                    controller: confirmnewPasswordController,
                    hintText: "Confirm  your new password",
                    obscureText: !isConfirmnewPasswordVisible.value,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm  your new password";
                      }
                      if (!AppString.passRegexp.hasMatch(value)) {
                        return "Invalid password";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 339.h),
                CustomButton(
                  text: "Update Password",
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      // Get.toNamed(Routes.mainpage);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
