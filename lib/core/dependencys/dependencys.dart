import 'package:blog_app/views/auth_pages/login_page.dart';
import 'package:blog_app/views/auth_pages/register_page.dart';
import 'package:blog_app/views/home_page/main_page.dart';
import 'package:blog_app/views/home_page/pagess/blog_page.dart';
import 'package:blog_app/views/home_page/pagess/bookmarks_page.dart';
import 'package:blog_app/views/home_page/pagess/profile_page.dart';
import 'package:blog_app/views/onboard_page.dart';
import 'package:get/get.dart';

class Dependencys extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardPage(), fenix: true);
    Get.lazyPut(() => LoginPage(), fenix: true);
    Get.lazyPut(() => RegisterPage(), fenix: true);
    Get.lazyPut(() => MainPage(), fenix: true);
    Get.lazyPut(() => BlogPage(), fenix: true);
    Get.lazyPut(() => BookmarksPage(), fenix: true);
    Get.lazyPut(() => ProfilePage(), fenix: true);
  }
}