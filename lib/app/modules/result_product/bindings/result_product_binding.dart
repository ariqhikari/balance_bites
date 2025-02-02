import 'package:get/get.dart';

import '../controllers/result_product_controller.dart';

class ResultProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultProductController>(
      () => ResultProductController(),
    );
  }
}
