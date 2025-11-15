import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType textInputType;
  final InputBorder? inputBorder;
  final Validator;
  final TextStyle? inputTextStyle;

  Customtextfield({
    super.key,
    this.inputTextStyle,
    this.inputBorder,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    required this.obscureText,
    required this.textInputType,
    this.Validator,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 56.h,
      child: TextFormField(
        style: inputTextStyle ?? TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        validator: Validator,
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.white12,
          hintStyle: TextStyle(color: Colors.white70),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white12),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white12),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
        ),
      ),
    );
  }
}
