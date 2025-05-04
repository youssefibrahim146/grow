
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/signup_controller.dart';
import '../controllers/splash_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
   // Get.lazyPut(() => GetStartedController(), fenix: true);
  //  Get.lazyPut(() => ResetPasswordController(), fenix: true);
  }
}
