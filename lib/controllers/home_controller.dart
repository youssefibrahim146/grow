
import 'package:get/get.dart';
import 'package:grow/constants/extensions.dart';

import '../constants/strings.dart';
import '../models/services/auth_services.dart';
import '../models/user_model.dart';

class HomeController extends GetxController {
  UserModel user = Get.arguments[0];
  String selectedScreen = AppStrings.homeText;

  List workouts = [
    {
      "name": "Push Ups",
      "description": "Push-ups are a great way to build upper body strength.",
      "image": "https://www.fitnesseducation.edu.au/wp-content/uploads/2020/10/Pushups.jpg",
    },
    {
      "name": "Squats",
      "description": "Squats are a great way to build lower body strength.",
      "image": "https://hips.hearstapps.com/hmg-prod/images/cyclistsquats-1676548052.jpeg?resize=640:*",
    },
    {
      "name": "Lunges",
      "description": "Lunges are a great way to build lower body strength.",
      "image": "https://trainingstation.co.uk/cdn/shop/articles/Lunges-movment_d958998d-2a9f-430e-bdea-06f1e2bcc835_900x.webp?v=1741687877",
    },
  ];

  signOut() {
    FirebaseAuthService().signOut().then(
      (value) {
        Get.offNamed(AppStrings.loginRoute);
      },
    ).catchError(
      (error) {
        error.toString().showToast;
      },
    );
  }
}
