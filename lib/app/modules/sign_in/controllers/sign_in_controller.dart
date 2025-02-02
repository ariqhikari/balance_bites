import 'package:balance_bites/app/data/data.dart';
import 'package:balance_bites/app/modules/user/user_controller.dart';
import 'package:balance_bites/app/routes/app_pages.dart';
import 'package:balance_bites/app/services/services.dart';
import 'package:balance_bites/app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final GlobalKey<FormState> sigInformKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserController userController = Get.put(UserController());
  RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    ApiReturnValue<User> result = await AuthServices.signIn(
      emailController.text,
      passwordController.text,
    );

    isLoading.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    userController.user.value = result.value!;
    Get.offAndToNamed(Routes.MAIN);
    showSnackBar("Login berhasil!", status: "Success");
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
