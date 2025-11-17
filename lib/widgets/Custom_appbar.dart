import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool centerTitle;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final double toolbarHeight;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.titleColor,
    this.centerTitle = true,
    this.elevation = 0,
    this.bottom,
    this.toolbarHeight = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.black,
      centerTitle: centerTitle,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (bottom?.preferredSize.height ?? 0));
}
