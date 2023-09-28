import 'package:get/get.dart';
import 'package:setifikasi_bnsp/app/pages/pengeluaran/controller/pengeluaran_controller.dart';

class PengeluaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengeluaranController>(() => PengeluaranController());
  }
}
