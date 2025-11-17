import 'package:blog_app/widgets/Custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_image/app_image.dart';
import '../../../../widgets/Custom_Text.dart';
import '../../../../widgets/Custom_appbar.dart';
import '../../../../widgets/custom_button.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  TextEditingController editnameController = TextEditingController();
  TextEditingController editemailController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile", leading: CustomBackButton()),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(64.r),
                  child: Image.asset(
                    AppImages.editprofileimage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: CustomText(
                  text: "Sophia Carter",
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(child: CustomText(text: "@sophiacarter")),
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
                  controller: editnameController,
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

              //email field=======================================
              CustomText(text: "Email", color: Colors.white),
              SizedBox(height: 3.h),
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white12,
                ),
                child: TextFormField(
                  controller: editemailController,
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

              //bio field=======================================
              CustomText(text: "Bio", color: Colors.white),
              SizedBox(height: 3.h),
              Container(
                height: 144.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white12,
                ),
                child: TextFormField(
                  controller: bioController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
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
                child: CustomButton(text: "Save Changes", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
