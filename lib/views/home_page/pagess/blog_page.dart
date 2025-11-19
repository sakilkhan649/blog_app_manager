import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_image/app_image.dart';
import '../../../widgets/Custom_appbar.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        title: "Blog",
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                AppImages.searchiconurl,
                height: 48.h,
                width: 48.w,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("Blog", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
