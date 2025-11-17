import 'package:flutter/material.dart';
import '../../../widgets/CustomButtomNav.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Book")),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
