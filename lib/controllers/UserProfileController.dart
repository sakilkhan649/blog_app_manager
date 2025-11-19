import 'dart:convert';
import 'package:blog_app/models/models.dart';
import 'package:blog_app/servicess/api_servicess.dart';
import 'package:blog_app/widgets/Custom_snakbar.dart';
import 'package:get/get.dart';
import '../servicess/Shared_servicess.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    try {
      isLoading.value = true;

      final token = await SharedService.getData(SetType.string, "token");

      if (token == null || token.isEmpty) {
        CustomFlushbar(message: 'Please login first', isSuccess: false);
        return;
      }
      final response = await ApiServicss.getUserProfile(token);
      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        user.value = UserModel.fromJson(json['data']['user']);

        CustomFlushbar(
          message: json['message'] ?? 'Profile loaded successfully',
        );
      } else {
        CustomFlushbar(message: json['message'] ?? 'Failed to load profile');
      }
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
