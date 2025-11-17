import 'package:blog_app/widgets/CustomBottomNav.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Text("Blog", style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
