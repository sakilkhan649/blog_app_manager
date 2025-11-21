import 'dart:convert';
import 'package:blog_app/servicess/Shared_servicess.dart';
import 'package:blog_app/utils/config/config.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/routs/routs.dart';
import '../widgets/Custom_snakbar.dart';

class ApiServicss {

  // ApiServicss class e helper method
  static Future<dynamic> handleResponse(http.Response response) async {
    if (response.statusCode == 401) {
      // Token expired or invalid
      await SharedService.removeData("token");
      Get.offAllNamed(Routes.loginpage);
      CustomFlushbar(message: 'Session expired. Please login again', isSuccess: false);
      return null;
    }
    return response;
  }



  // =================== Authentication APIs ===================

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


  static Future<http.Response> logout(String token) async {
    return await http.post(
      AppConfig.logoutUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  // =================== User Profile APIs ===================

  static Future<http.Response> getUserProfile(String token) async {
    return await http.get(
      AppConfig.userProfileUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<http.Response> updateUserProfile({
    required String token,
    required String name,
    required String phone,
  }) async {
    return await http.put(
      AppConfig.userProfileUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "name": name,
        "phone": phone,
      }),
    );
  }

  static Future<http.Response> changePassword({
    required String token,
    required String currentPassword,
    required String newPassword,
  }) async {
    return await http.post(
      AppConfig.changePasswordUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "current_password": currentPassword,
        "new_password": newPassword,
      }),
    );
  }

  // =================== Blog Posts APIs ===================

  static Future<http.Response> getAllPosts({
    int page = 1,
    int perPage = 10,
    String? token,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return await http.get(
      Uri.parse("${AppConfig.apiUrl}/posts?page=$page&per_page=$perPage"),
      headers: headers,
    );
  }

  static Future<http.Response> getPostById({
    required int postId,
    String? token,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return await http.get(
      Uri.parse("${AppConfig.apiUrl}/posts/$postId"),
      headers: headers,
    );
  }

  static Future<http.Response> getPostsByCategory({
    String? category,
    int? categoryId,
    int page = 1,
    int perPage = 10,
    String? token,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    String url = "${AppConfig.apiUrl}/posts/category?page=$page&per_page=$perPage";
    if (category != null) url += "&category=$category";
    if (categoryId != null) url += "&category_id=$categoryId";

    return await http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  static Future<http.Response> searchPosts({
    required String query,
    int page = 1,
    int perPage = 10,
    String? token,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return await http.get(
      Uri.parse(
          "${AppConfig.apiUrl}/posts/search?q=$query&page=$page&per_page=$perPage"),
      headers: headers,
    );
  }

  // =================== Categories APIs ===================

  static Future<http.Response> getAllCategories() async {
    return await http.get(
      AppConfig.categoriesUrl,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future<http.Response> getCategoryById(int categoryId) async {
    return await http.get(
      Uri.parse("${AppConfig.apiUrl}/categories/$categoryId"),
      headers: {'Content-Type': 'application/json'},
    );
  }

  // =================== Comments APIs ===================

  static Future<http.Response> addComment({
    required String token,
    required int postId,
    required String content,
    int parentId = 0,
  }) async {
    return await http.post(
      AppConfig.commentsUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "post_id": postId,
        "content": content,
        "parent_id": parentId,
      }),
    );
  }

  static Future<http.Response> getPostComments({
    required int postId,
    int page = 1,
    int perPage = 20,
    String? token,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return await http.get(
      Uri.parse(
          "${AppConfig.apiUrl}/comments/post/$postId?page=$page&per_page=$perPage"),
      headers: headers,
    );
  }

  static Future<http.Response> updateComment({
    required String token,
    required int commentId,
    required String content,
  }) async {
    return await http.put(
      Uri.parse("${AppConfig.apiUrl}/comments/$commentId"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "content": content,
      }),
    );
  }

  static Future<http.Response> deleteComment({
    required String token,
    required int commentId,
  }) async {
    return await http.delete(
      Uri.parse("${AppConfig.apiUrl}/comments/$commentId"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  // =================== Likes APIs ===================

  static Future<http.Response> likePost({
    required String token,
    required int postId,
  }) async {
    return await http.post(
      Uri.parse("${AppConfig.apiUrl}/posts/$postId/like"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<http.Response> unlikePost({
    required String token,
    required int postId,
  }) async {
    return await http.delete(
      Uri.parse("${AppConfig.apiUrl}/posts/$postId/like"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<http.Response> getPostLikes({
    required int postId,
    String? token,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return await http.get(
      Uri.parse("${AppConfig.apiUrl}/posts/$postId/likes"),
      headers: headers,
    );
  }

  static Future<http.Response> getUserLikedPosts(String token) async {
    return await http.get(
      AppConfig.userLikesUrl,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }
}

