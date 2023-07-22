import 'package:get/get.dart';

import '../../../../presentation/list_pembayaran/controllers/list_pembayaran.controller.dart';

class ListPembayaranControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPembayaranController>(
      () => ListPembayaranController(),
    );
  }
}
