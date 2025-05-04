import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow/constants/extensions.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img.png",
              scale: 3,
            ),
            20.gap,
            const Text(
              AppStrings.appTitle,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
