import 'package:blog_app/views/auth_pages/login_page.dart';
import 'package:blog_app/views/auth_pages/register_page.dart';
import 'package:blog_app/views/home_page/main_page.dart';
import 'package:blog_app/views/home_page/pagess/blog_page.dart';
import 'package:blog_app/views/home_page/pagess/bookmarks_page.dart';
import 'package:blog_app/views/home_page/pagess/profile_page.dart';
import 'package:blog_app/views/onboard_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String ondoardpage = "/Onboardpage";
  static const String loginpage = "/Loginpage";
  static const String registerpage = "/Registerpage";
  static const String mainpage = "/Mainpage";
  static const String blogpage = "/Blogpage";
  static const String bookmarksPage = "/BookmarksPage";
  static const String profilePage = "/ProfilePage";

  static List<GetPage> routes = [
    GetPage(name: ondoardpage, page: () => OnboardPage()),
    GetPage(name: loginpage, page: () => LoginPage()),
    GetPage(name: registerpage, page: () => RegisterPage()),
    GetPage(name: mainpage, page: () => MainPage()),
    GetPage(name: blogpage, page: () => BlogPage()),
    GetPage(name: bookmarksPage, page: () => BookmarksPage()),
    GetPage(name: profilePage, page: () => ProfilePage()),
  ];
}