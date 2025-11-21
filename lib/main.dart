import 'package:blog_app/core/routs/routs.dart';
import 'package:blog_app/views/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'core/dependencys/dependencys.dart';

void main() {
  Dependencys di = Dependencys();
  di.dependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: Routes.routes,
        home: OnboardPage(),
      ),
    );
  }
}
