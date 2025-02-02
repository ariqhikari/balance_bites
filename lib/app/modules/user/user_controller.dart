import 'package:balance_bites/app/data/data.dart';
import 'package:balance_bites/app/services/services.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var user = const User(name: "", email: "").obs;

  Future<void> verifyToken() async {
    ApiReturnValue<User> result = await AuthServices.loadUser();

    if (result.value != null) {
      user.value = result.value!;
    }
  }
}
