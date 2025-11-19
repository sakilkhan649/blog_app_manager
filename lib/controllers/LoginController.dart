import 'dart:convert';
import 'package:blog_app/core/routs/routs.dart';
import 'package:blog_app/servicess/api_servicess.dart';
import 'package:blog_app/widgets/Custom_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

        CustomFlushbar(message: 'Login Successful', isSuccess: true);

        Get.offAllNamed(Routes.mainpage);
      } else {
        CustomFlushbar(message: json['message'], isSuccess: false);
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
