import '../../../../../domain/core/core.dart';

class ValueRiwayatPembayaran extends GetView<HomeController> {
  const ValueRiwayatPembayaran({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
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
          (state) => SizedBox(
            height: 110.0,
            width: Get.width,
            child: state!.riwayatPembayaran!.isEmpty
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
                    itemCount: state.riwayatPembayaran!.length,
                    itemBuilder: (context, index) {
                      return CardRiwayatPembayaran(
                        listData: state.riwayatPembayaran!,
                        index: index,
                      );
                    },
                  ),
          ),
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
