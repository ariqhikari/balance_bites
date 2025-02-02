import 'package:balance_bites/app/data/data.dart';
import 'package:balance_bites/app/services/services.dart';
import 'package:balance_bites/app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> signUpformKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
    ApiReturnValue<bool> result = await AuthServices.signUp(
      nameController.text,
      emailController.text,
      passwordController.text,
    );

    isLoading.value = false;

    if (result.value == null) {
      showSnackBar(result.message!);
      return;
    }

    Get.back();
    showSnackBar(result.message!, status: "Success");
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confPasswordController.dispose();
    super.onClose();
  }
}
