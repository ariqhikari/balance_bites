import 'package:balance_bites/app/shared/shared.dart';
import 'package:balance_bites/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: FutureBuilder(
          future: controller.moveToHome(),
          builder: (context, snapshot) => Center(
            child: Image.asset("assets/images/logo-text.png"),
          ),
        ),
      ),
    );
  }
}
