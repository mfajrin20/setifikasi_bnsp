import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/pages/pemasukan/controller/pemasukan_controller.dart';

class PemasukanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemasukanController>(() => PemasukanController());
  }
}
