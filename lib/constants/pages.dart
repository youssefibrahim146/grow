
import 'package:get/get.dart';
import 'package:grow/constants/strings.dart';
import 'package:grow/views/screens/chat_screen.dart';
import 'package:grow/views/screens/gym_card_details.dart';

import '../views/screens/home_screen.dart';
import '../views/screens/login_screen.dart';
import '../views/screens/signup_screen.dart';
import '../views/screens/splash_screen.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: AppStrings.homeRoute, page: () => const HomeScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.loginRoute, page: () => const LoginScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.splashRoute, page: () => const SplashScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.signupRoute, page: () => const SignUpScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.chatRoute, page: () => const ChatScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.gymDetailsRoute, page: () => const GymCardDetails(), transition: Transition.noTransition),
  ];
}
