import 'package:blog_app/views/auth_pages/login_page.dart';
import 'package:blog_app/views/auth_pages/register_page.dart';
import 'package:blog_app/views/onboard_page.dart';
import 'package:get/get.dart';

class Dependencys extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardPage(), fenix: true);
    Get.lazyPut(() => LoginPage(), fenix: true);
    Get.lazyPut(() => RegisterPage(), fenix: true);
  }
}