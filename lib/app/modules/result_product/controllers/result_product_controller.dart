import 'package:balance_bites/app/data/data.dart';
import 'package:balance_bites/app/services/services.dart';
import 'package:get/get.dart';

class ResultProductController extends GetxController {
  var productUpc = Get.arguments;
  var selectedIndex = 0.obs;
  var isLoading = true.obs;

  Rx<Product?> product = Rx<Product?>(null);

  @override
  void onInit() {
    super.onInit();
    getDetailProductByUpc();
  }

  void getDetailProductByUpc() async {
    ApiReturnValue<Product> result =
        await ProductServices.getProductByUpc(productUpc.toString());

    isLoading.value = false;
    if (result.value != null) {
      product.value = result.value!;
    }
  }
}
