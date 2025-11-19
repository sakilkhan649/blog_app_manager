import 'package:blog_app/utils/app_const/app_const.dart';
import 'package:blog_app/widgets/Custom_appbar.dart';
import 'package:blog_app/widgets/Custom_back_button.dart';
import 'package:blog_app/widgets/Custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/LoginController.dart';
import '../../core/routs/routs.dart';
import '../../widgets/Custom_Text.dart';
import '../../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(LoginControllers());
  final isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(title: "Sign in", leading: CustomBackButton()),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: CustomText(
                    text: "Welcome Back!",
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12.h),
                Customtextfield(
                  controller: controller.emailController,
                  hintText: "Email",
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
                SizedBox(height: 24.h),

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
                    hintText: "Password",
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

                SizedBox(height: 49.h),
                Obx(
                  () => controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : CustomButton(
                          text: "Sign in",
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              controller.login();
                            }
                          },
                        ),
                ),
                SizedBox(height: 322.h),
                CustomText(text: "Don't have an account?"),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.registerpage);
                  },
                  child: CustomText(text: "Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
