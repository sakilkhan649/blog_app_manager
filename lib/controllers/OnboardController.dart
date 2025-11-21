import 'package:get/get.dart';
import '../core/routs/routs.dart';
import '../servicess/Shared_servicess.dart';

class Onboardcontroller extends GetxController {

  Future<void> navigateToNextPage() async {
    // Token check করুন
    final token = await SharedService.getData(SetType.string, "token");

    if (token != null && token.isNotEmpty) {
      // Token আছে, MainPage এ যান
      Get.offAllNamed(Routes.mainpage);
    } else {
      // Token নেই, LoginPage এ যান
      Get.toNamed(Routes.loginpage);
    }
  }
}