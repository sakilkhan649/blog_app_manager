import 'dart:convert';
import 'package:blog_app/servicess/Shared_servicess.dart';
import 'package:blog_app/servicess/api_servicess.dart';
import 'package:blog_app/widgets/Custom_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/routs/routs.dart';

class UpdatePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> changePassword() async {
    try {
      isLoading.value = true;

      final token = await SharedService.getData(SetType.string, "token");

      if (token == null || token.isEmpty) {
        CustomFlushbar(message: "Please login first", isSuccess: false);

        return;
      }

      final response = await ApiServicss.changePassword(
        token: token,
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (json["data"] != null && json["data"]["token"] != null) {
          await SharedService.setData(
            SetType.string,
            "token",
            json["data"]["token"],
          );
        }

        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();

        CustomFlushbar(
          message: "Password changed successfully",
          isSuccess: true,
        );

        Get.offAllNamed(Routes.profilePage);
      } else {
        CustomFlushbar(message: json['message'] ?? "Password change failed");
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
