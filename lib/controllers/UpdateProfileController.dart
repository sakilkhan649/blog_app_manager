import 'dart:convert';
import 'package:blog_app/servicess/api_servicess.dart';
import 'package:blog_app/widgets/Custom_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../servicess/Shared_servicess.dart';
import 'UserProfileController.dart';

class Updateprofilecontroller extends GetxController {
  var isLoading = false.obs;

  TextEditingController editNameController = TextEditingController();
  TextEditingController editPhoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    final profileController = Get.find<ProfileController>();
    if (profileController.user.value != null) {
      editNameController.text = profileController.user.value!.name;
      editPhoneController.text = profileController.user.value!.phone!;
    }
  }

  Future<void> updateUserProfile() async {
    try {
      isLoading.value = true;

      final token = await SharedService.getData(SetType.string, "token");

      if (token == null || token.isEmpty) {
        CustomFlushbar(message: 'Please login first', isSuccess: false);
        return;
      }

      final response = await ApiServicss.updateUserProfile(
        token: token,
        name: editNameController.text.trim(),
        phone: editPhoneController.text.trim(),
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        CustomFlushbar(
          message: json['message'] ?? 'Profile updated successfully',
        );

        final profileController = Get.find<ProfileController>();
        await profileController.getUserProfile();

        Get.back();
      } else {
        CustomFlushbar(
          message: json['message'] ?? 'Failed to update profile',
          isSuccess: false,
        );
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    editNameController.dispose();
    editPhoneController.dispose();
    super.onClose();
  }
}
