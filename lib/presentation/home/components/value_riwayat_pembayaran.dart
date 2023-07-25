import 'package:manajemen_kost_by_user/presentation/home/components/card_riwayat_pembayaran.dart';

import '../../../../../domain/core/core.dart';

class ValueRiwayatPembayaran extends GetView<ListPembayaranController> {
  const ValueRiwayatPembayaran({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ListPembayaranController>(() => ListPembayaranController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeApp.h20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorApp.blackText,
              fontSize: 18,
            ),
          ),
        ),
        controller.obx(
          (state) {
            final dataPembayaranKamarINI = state!
                .where(
                  (e) => e.idKamar.id == ConstansApp.idKamarLogin,
                )
                .toList();
            return Center(
              child: SizedBox(
                height: 110.0,
                width: Get.width,
                child: dataPembayaranKamarINI.isEmpty
                    ? const Center(
                        child: Text(
                          'Riwayat Pembayaran kosong',
                          style: TextStyle(
                            color: ColorApp.gray,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: dataPembayaranKamarINI.length,
                        itemBuilder: (context, index) {
                          return CardRiwayatPembayaran(
                            listData: dataPembayaranKamarINI,
                            index: index,
                          );
                        },
                      ),
              ),
            );
          },
          onEmpty: const Center(child: Text("Masih Kosong")),
          onLoading: const SizedBox(height: 130, child: LoadingState()),
          onError: (e) {
            return Center(child: Text("pesan error : $e"));
          },
        )
      ],
    );
  }
}
