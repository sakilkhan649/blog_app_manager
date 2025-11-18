import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  TextEditingController editNameController = TextEditingController();
  TextEditingController editEmailController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void onClose() {
    // controller dispose
    editNameController.dispose();
    editEmailController.dispose();
    bioController.dispose();
    super.onClose();
  }
}
