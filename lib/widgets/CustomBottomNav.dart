import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/NabbarController.dart';
import '../utils/app_image/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNav extends StatelessWidget {
  CustomBottomNav({super.key});

  final BottomNavController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: EdgeInsets.fromLTRB(42.w, 8.h, 42.w, 12.h),
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(top: BorderSide(color: Colors.white12, width: 1)),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navItem(icon: AppImages.blogiconurl, label: "Blog", index: 0),
              _navItem(
                icon: AppImages.bookmarksiconurl,
                label: "Bookmarks",
                index: 1,
              ),
              _navItem(
                icon: AppImages.profileiconurl,
                label: "Profile",
                index: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required String icon,
    required String label,
    required int index,
  }) {
    final BottomNavController controller = Get.find();
    bool isActive = controller.currentIndex.value == index;

    return InkWell(
      onTap: () => controller.changePage(index),
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : Colors.white70,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.white70,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}