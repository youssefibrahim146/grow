import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/constants/extensions.dart';

import '../constants/strings.dart';
import '../models/services/auth_services.dart';


class LoginController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  bool isLoginClicked = false;
  String email = AppStrings.emptySign;
  String password = AppStrings.emptySign;
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> loginFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    email = AppStrings.emptySign;
    password = AppStrings.emptySign;
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isLoginClicked) {
      loginFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To login, and check if the user is on guest account or not to.
  Future<void> login() async {
    isLoading = true;
    isLoginClicked = true;
    checkFields();
    if (loginFormStateKey.currentState!.validate()) {
      loginFormStateKey.currentState!.save();
      dynamic loginResponse = await FirebaseAuthService().signIn(email, password);
      if (loginResponse is User) {
        Get.offNamed(AppStrings.splashRoute);
      } else {
        loginResponse.toString().showToast;
      }
    }
    isLoading = false;
    update();
  }
}
