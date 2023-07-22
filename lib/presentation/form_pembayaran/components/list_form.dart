import '../../../../domain/core/core.dart';
import '../../../domain/formatter/money_formatter.dart';

class FormPemasukan extends GetView<FormPembayaranController> {
  const FormPemasukan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Column(
        children: [
          TextForm.border(
            onTap: controller.alartJenis,
            controller: controller.jenisC,
            titel: "Jenis",
            isCheck: true,
            suffixIcon: const Icon(Icons.keyboard_arrow_down),
          ),
          SizeApp.h16,
          TextForm.border(
            controller: controller.kamarC,
            titel: "Kamar",
            isCheck: true,
          ),
          SizeApp.h16,
          TextForm.border(
            controller: controller.idrC,
            titel: "IDR",
            isCheck: true,
            textInputType: TextInputType.number,
            inputFormatters: [MoneyFormatter()],
          ),
        ],
      ),
      onEmpty: const Center(child: Text("Masih Kosong")),
      onLoading: const LoadingState(),
      onError: (e) {
        return Center(child: Text("pesan error : $e"));
      },
    );
  }
}
