import 'dart:convert';
import 'package:blog_app/servicess/api_servicess.dart';
import 'package:blog_app/widgets/Custom_snakbar.dart';
import 'package:get/get.dart';
import '../core/routs/routs.dart';
import '../servicess/Shared_servicess.dart';

class Logoutcontroller extends GetxController {
  var isLoading = false.obs;

  Future<void> logout() async {
    try {
      isLoading.value = true;
      final token = await SharedService.getData(SetType.string, "token");

      if (token == null || token.isEmpty) {
        CustomFlushbar(
          message: 'No token found. Please login again.',
          isSuccess: false,
        );
        Get.offAllNamed(Routes.loginpage);
        return;
      }
      final response = await ApiServicss.logout(token);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        await SharedService.removeData("token");

        CustomFlushbar(message: json['message'] ?? "Logout Successful");

        Get.offAllNamed(Routes.loginpage);
      } else {
        final json = jsonDecode(response.body);
        CustomFlushbar(message: json['message'] ?? 'Logout failed');
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
