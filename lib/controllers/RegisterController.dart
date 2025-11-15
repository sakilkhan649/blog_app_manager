import 'dart:convert';
import 'package:blog_app/servicess/api_servicess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../servicess/sheard_services.dart';

class Registercontroller extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> register() async {
    try {
      isLoading.value = true;

      final response = await ApiServicss.register(
        username: usernameController.text,
        password: passwordController.text,
        phone: phoneController.text,
        email: emailController.text,
        confrimpassword: confirmpasswordController.text,
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 201) {
        await SharedService.setData(
          SetType.string,
          "token",
          json["data"]["token"],
        );

        usernameController.clear();
        phoneController.clear();
        confirmpasswordController.clear();
        emailController.clear();
        passwordController.clear();

        Get.snackbar(
          'Success',
          'Registration Successful',
          backgroundColor: Colors.white70,
        );
        // Get.offAll(() => HomePage());
      } else {
        Get.snackbar('Error', json['message'], backgroundColor: Colors.white70);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString(), backgroundColor: Colors.white70);
    } finally {
      isLoading.value = false;
    }
  }
}
