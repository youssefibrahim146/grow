import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'constants/bindings.dart';
import 'constants/colors.dart';
import 'constants/pages.dart';
import 'constants/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.transparentColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      getPages: AppPages.appPages,
      theme: ThemeData(
        fontFamily: AppStrings.elMessiriFont,
        primaryColor: AppColors.darkGoldColor,
        splashColor: AppColors.transparentColor,
        highlightColor: AppColors.transparentColor,
        scaffoldBackgroundColor: AppColors.whiteColor,
        appBarTheme: AppBarTheme(color: AppColors.darkNbetyColor, iconTheme: IconThemeData(color: AppColors.darkGoldColor)),
      ),
      initialBinding: AppBindings(),
      initialRoute: FirebaseAuth.instance.currentUser != null ? AppStrings.splashRoute : AppStrings.loginRoute,
    );
  }
}
