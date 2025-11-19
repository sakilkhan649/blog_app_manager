import 'package:blog_app/controllers/RegisterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../core/routs/routs.dart';
import '../../utils/app_const/app_const.dart';
import '../../widgets/Custom_Text.dart';
import '../../widgets/Custom_appbar.dart';
import '../../widgets/Custom_back_button.dart';
import '../../widgets/Custom_textField.dart';
import '../../widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(Registercontroller());
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(
          title: "Create Account",
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
                CustomText(text: "Username", fontSize: 16, color: Colors.white),
                SizedBox(height: 5.h),
                Customtextfield(
                  controller: controller.usernameController,
                  hintText: "Enter your username",
                  obscureText: false,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Username";
                    }
                    if (!AppString.usernameRegexp.hasMatch(value)) {
                      return "Invalid Username";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomText(text: "Email", fontSize: 16, color: Colors.white),
                SizedBox(height: 5.h),
                Customtextfield(
                  controller: controller.emailController,
                  hintText: "Enter your email",
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your Email";
                    }
                    if (!AppString.emailRegexp.hasMatch(value)) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomText(text: "Phone", fontSize: 16, color: Colors.white),
                SizedBox(height: 5.h),
                Customtextfield(
                  controller: controller.phoneController,
                  hintText: "Enter your phone number",
                  obscureText: false,
                  textInputType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your phone number";
                    }
                    if (!AppString.phoneRegexp.hasMatch(value)) {
                      return "Invalid phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomText(text: "Password", fontSize: 16, color: Colors.white),
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
                    controller: controller.passwordController,
                    hintText: "Confirm your password",
                    obscureText: !isPasswordVisible.value,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Password";
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
                  text: "Confirm Password",
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
                    controller: controller.confirmpasswordController,
                    hintText: "Confirm your password",
                    obscureText: !isConfirmPasswordVisible.value,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your Password";
                      }
                      if (!AppString.passRegexp.hasMatch(value)) {
                        return "Invalid password";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 24.h),
                Obx(
                  () => controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : CustomButton(
                          text: "Register",
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              controller.register();
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
