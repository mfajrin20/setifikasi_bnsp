import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/pages/Auth/controller/login_controller.dart';

class Loginbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
