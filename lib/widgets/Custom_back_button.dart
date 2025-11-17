import 'package:blog_app/utils/app_image/app_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: SvgPicture.asset(
          AppImages.backiconurl,
          height: 24.h,
          width: 24.w,
        ),
      ),
    );
  }
}
