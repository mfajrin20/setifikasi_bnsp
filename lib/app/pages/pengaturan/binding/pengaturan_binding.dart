import 'package:get/get.dart';

import '../controller/pengaturan_controller.dart';

class PengaturanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengaturanController>(() => PengaturanController());
  }
}
