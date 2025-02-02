import 'package:balance_bites/app/modules/user/user_controller.dart';
import 'package:balance_bites/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final UserController userController = Get.find<UserController>();

  moveToHome() async {
    await userController.verifyToken();

    Future.delayed(const Duration(seconds: 3), () {
      if (userController.user.value.name == "") {
        Get.offAllNamed(Routes.SIGN_IN);
      } else {
        Get.offAllNamed(Routes.MAIN);
      }
    });
  }
}
