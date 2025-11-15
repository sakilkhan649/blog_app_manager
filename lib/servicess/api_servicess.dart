import 'dart:convert';

import 'package:blog_app/utils/config/config.dart';
import 'package:http/http.dart' as http;

class ApiServicss {
  static Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    return await http.post(
      AppConfig.loginUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );
  }
  //=================Register=========================

  static Future<http.Response> register({
    required String username,
    required String password,
    required String phone,
    required String email,
    required String confrimpassword,
  }) async {
    return await http.post(
      AppConfig.registerUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "name": username,
        "email": email,
        "password": password,
        "phone": phone,
      }),
    );
  }
}
