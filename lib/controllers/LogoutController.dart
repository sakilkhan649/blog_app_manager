import 'dart:convert';
import 'package:blog_app/servicess/api_servicess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/helper.dart';
import '../servicess/Shared_servicess.dart';

class LoginControllers extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading.value = true;

      final response = await ApiServicss.login(
        email: emailController.text,
        password: passwordController.text,
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await SharedService.setData(
          SetType.string,
          "token",
          json["data"]["token"],
        );

        emailController.clear();
        passwordController.clear();

        Get.snackbar(
          'Success',
          'Login Successful',
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
