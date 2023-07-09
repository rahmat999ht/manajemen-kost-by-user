import 'package:get/get.dart';

import '../../../../presentation/form_pembayaran/controllers/form_pembayaran.controller.dart';

class FormPembayaranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormPembayaranController>(
      () => FormPembayaranController(),
    );
  }
}
