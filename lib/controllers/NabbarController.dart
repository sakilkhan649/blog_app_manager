import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../views/home_page/pagess/blog_page.dart';
import '../views/home_page/pagess/bookmarks_page.dart';
import '../views/home_page/pagess/profile_page.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = [BlogPage(), BookmarksPage(), ProfilePage()];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
