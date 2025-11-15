import 'package:blog_app/utils/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({super.key, this.title = 'Back'});
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23.h,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            AppImages.backiconurl,
            height: 24.h,
            width: 24.w,
          ),
        ),
      ),
    );
  }
}
