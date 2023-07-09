import 'package:get/get.dart';

import '../../../../presentation/pembayaran/controllers/pembayaran.controller.dart';

class PembayaranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranController>(
      () => PembayaranController(),
    );
  }
}
