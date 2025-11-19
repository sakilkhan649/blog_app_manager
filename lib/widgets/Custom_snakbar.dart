import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomFlushbar extends StatelessWidget {
  final String message;
  final bool isSuccess;

  const CustomFlushbar({Key? key, required this.message, this.isSuccess = true})
    : super(key: key);

  void show(BuildContext context) {
    Flushbar(
      messageText: Row(
        children: [
          Icon(
            isSuccess ? Icons.check_circle : Icons.error,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(message, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      duration: Duration(seconds: 2),
      borderRadius: BorderRadius.circular(10),
      margin: EdgeInsets.all(16),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) => SizedBox.shrink();
}
