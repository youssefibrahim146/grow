import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/constants/extensions.dart';

import '../constants/strings.dart';
import '../models/services/auth_services.dart';
import '../models/services/firebase_services.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  bool isSignUpClicked = false;
  String email = AppStrings.emptySign;
  String password = AppStrings.emptySign;
  String name = AppStrings.emptySign;
  String gender = AppStrings.emptySign;
  String weight = AppStrings.emptySign;
  String height = AppStrings.emptySign;
  String plan = AppStrings.emptySign;
  String drugTime = AppStrings.emptySign;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController drugTimeController = TextEditingController();
  TextEditingController planController = TextEditingController();


  GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    email = AppStrings.emptySign;
    password = AppStrings.emptySign;
    name = AppStrings.emptySign;
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isSignUpClicked) {
      signUpFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To sign up.
  Future<void> signUp() async {
    isLoading = true;
    isSignUpClicked = true;
    checkFields();
    if (signUpFormStateKey.currentState!.validate()) {
      signUpFormStateKey.currentState!.save();
      dynamic signUpResponse = await FirebaseAuthService().signUp(
        email,
        password,
      );
      if (signUpResponse is User) {
        FirebaseAuthService().signOut();
        UserModel user = UserModel(
          email: email,
          name: name,
          gender: gender,
          weight: weight,
          height: height,
          drugTime: drugTime,
          plan: plan,
        );
        dynamic uploadUserResponse = await FirebaseServices.uploadUser(user);
        if (uploadUserResponse is UserModel) {
          Get.offNamed(AppStrings.loginRoute);
        } else {
          uploadUserResponse.toString().showToast;
        }
      } else {
        signUpResponse.toString().showToast;
      }
    }
    isLoading = false;
    update();
  }
}
