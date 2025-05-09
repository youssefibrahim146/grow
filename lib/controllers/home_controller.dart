
import 'package:get/get.dart';
import 'package:grow/constants/extensions.dart';

import '../constants/strings.dart';
import '../models/services/auth_services.dart';
import '../models/user_model.dart';

class HomeController extends GetxController {
  UserModel user = Get.arguments[0];
  String selectedScreen = AppStrings.homeText;

  List banners = [
    "https://m.media-amazon.com/images/I/61D-kTGXnWL._AC_UF894,1000_QL80_.jpg",
    "https://m.media-amazon.com/images/I/71j-ZCubDWL._AC_UF894,1000_QL80_.jpg",
    "https://as1.ftcdn.net/jpg/04/94/01/92/1000_F_494019215_jZTW9skIs18uoKjZinCbxOflLhJm14iy.jpg",
    "https://img.freepik.com/free-photo/build-your-own-body-strength-fitness-exercise-get-fit_53876-21370.jpg",
  ];

  List workouts = [
    {
      "name": "Push Ups",
      "description": "Push-ups are a great way to build upper body strength.",
      "image": "https://www.fitnesseducation.edu.au/wp-content/uploads/2020/10/Pushups.jpg",
      "video": "https://youtu.be/bt5b9x9N0KU",
    },
    {
      "name": "Squats",
      "description": "Squats are a great way to build lower body strength.",
      "image": "https://hips.hearstapps.com/hmg-prod/images/cyclistsquats-1676548052.jpeg?resize=640:*",
      "video": "https://discord.com/channels/@me/1360221955441164448/1369997907276595242",
    },
    {
      "name": "Lunges",
      "description": "Lunges are a great way to build lower body strength.",
      "image": "https://trainingstation.co.uk/cdn/shop/articles/Lunges-movment_d958998d-2a9f-430e-bdea-06f1e2bcc835_900x.webp?v=1741687877",
      "video": "https://www.youtube.com/watch?v=QOVaH8SZXdo",
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
