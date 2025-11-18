import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_image/app_image.dart';
import '../../../widgets/Custom_appbar.dart';
import '../../../widgets/Custom_back_button.dart';

class BlogDitailsPage extends StatelessWidget {
  const BlogDitailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        leading: CustomBackButton(),
        title: "",
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                AppImages.bookmarksiconurl,
                height: 48.h,
                width: 48.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
