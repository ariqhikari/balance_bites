import 'package:get/get.dart';

import '../controllers/result_calculator_controller.dart';

class ResultCalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultCalculatorController>(
      () => ResultCalculatorController(),
    );
  }
}
