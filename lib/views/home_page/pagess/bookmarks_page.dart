import 'package:blog_app/widgets/Custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_image/app_image.dart';
import '../../../widgets/CustomBottomNav.dart';
import '../../../widgets/Custom_appbar.dart';
import '../../../widgets/Custom_back_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarksPage extends StatelessWidget {
  BookmarksPage({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: "Bookmarks", leading: CustomBackButton()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white12,
              ),
              child: TextFormField(
                controller: searchController,
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: "Search bookmarks",
                  hintStyle: TextStyle(color: Colors.white12,),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: SvgPicture.asset(
                        AppImages.searchiconurl,
                        height: 48.h,
                        width: 48.w,
                        colorFilter: ColorFilter.mode(Colors.white12, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
