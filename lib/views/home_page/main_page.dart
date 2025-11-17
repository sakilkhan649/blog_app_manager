import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/NabbarController.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
      ),
    );
  }
}
