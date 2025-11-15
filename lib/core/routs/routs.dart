import 'package:blog_app/views/auth_pages/login_page.dart';
import 'package:blog_app/views/auth_pages/register_page.dart';
import 'package:blog_app/views/onboard_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String ondoardpage = "/Onboardpage";
  static const String loginpage = "/Loginpage";
  static const String registerpage = "/Registerpage";

  static List<GetPage> routes = [
    GetPage(name: ondoardpage, page: () => OnboardPage()),
    GetPage(name: loginpage, page: () => LoginPage()),
    GetPage(name: registerpage, page: () => RegisterPage()),
  ];
}