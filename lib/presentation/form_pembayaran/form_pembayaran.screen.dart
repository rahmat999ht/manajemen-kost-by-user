import '../../domain/core/core.dart';
import 'components/image_wrapper_pemasukan.dart';
import 'components/list_form.dart';
import 'controllers/image_pemasukan.controller.dart';

class FormPembayaranScreen extends GetView<FormPembayaranController> {
  const FormPembayaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ImagesPembayaranController());
    Get.lazyPut(() => FormPembayaranController());
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBatal('Pembayaran', Get.back),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: controller.formKey,
          child: const Column(
            children: [
              FormPemasukan(),
              WrapperImagePickerPembayaran(),
              Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(
        () => Padding(
          padding: const EdgeInsets.all(18.0),
          child: ButtonPrymary.isBlack(
            isLoading: controller.loading.value,
            text: 'Simpan',
            onPressed: controller.addPemasukan,
          ),
        ),
      ),
    );
  }
}
