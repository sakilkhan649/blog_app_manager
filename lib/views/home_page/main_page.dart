import 'package:blog_app/utils/app_image/app_image.dart';
import 'package:blog_app/views/home_page/pagess/blog_page.dart';
import 'package:blog_app/views/home_page/pagess/bookmarks_page.dart';
import 'package:blog_app/views/home_page/pagess/profilepagess/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  var currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: currentIndex.value,
          children: [BlogPage(), BookmarksPage(), Container()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            border: Border(top: BorderSide(color: Colors.white12, width: 1)),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: currentIndex.value,
            onTap: (index) {
              if (index < 2) {
                currentIndex.value = index;

                if (index == 1) {}
              } else {
                Get.to(() => ProfilePage());
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.blogiconurl,
                  width: 25.w,
                  height: 25.h,
                  colorFilter: ColorFilter.mode(
                    currentIndex.value == 0 ? Colors.white : Colors.white70,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Blog',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.bookmarksiconurl,
                  width: 25.w,
                  height: 25.h,
                  colorFilter: ColorFilter.mode(
                    currentIndex.value == 1 ? Colors.white : Colors.white70,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Bookmarks',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.profileiconurl,
                  width: 25.w,
                  height: 25.h,
                  colorFilter: ColorFilter.mode(
                    currentIndex.value == 2 ? Colors.white : Colors.white70,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
