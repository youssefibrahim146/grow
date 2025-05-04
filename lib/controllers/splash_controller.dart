
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:grow/constants/extensions.dart';

import '../constants/strings.dart';
import '../models/services/firebase_services.dart';
import '../models/user_model.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  /// To get the user data.
  Future<void> getData() async {
    FirebaseAuth.instance.currentUser != null
        ? Future.delayed(5.sec, () async {
          dynamic fetchUserResponse = await FirebaseServices.fetchCurrentUser();
          if (fetchUserResponse is UserModel) {
            Get.offNamed(AppStrings.homeRoute, arguments: [fetchUserResponse]);
          } else {
            fetchUserResponse.toString().showToast;
          }
        })
        : Future.delayed(5.sec, () {
          Get.offNamed(AppStrings.getStartedRoute);
        });
  }
}
