import '../../../../../domain/core/core.dart';

class CardRiwayatPembayaran extends GetView<HomeController> {
  const CardRiwayatPembayaran({
    
    super.key,
    required this.listData,
    required this.index,
  });

  final List<PembayaranModel> listData;
  final int index;

  @override
  Widget build(BuildContext context) {
    final PembayaranModel data = listData[index];
    final jenisPem = data.jenis;
    final bulan = controller.months[data.dateUpload.toDate().month - 1];
    final jumlahPem = controller.formatRupiah('${data.idr}');
    return Container(
      margin: EdgeInsets.only(
        left: 12,
        bottom: 20,
        top: 12,
        right: listData.length == index + 1 ? 30 : 0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50.0,
      width: Get.width * 0.44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(10.0, 10.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                jenisPem,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.blackText,
                ),
              ),
              const Spacer(),
              Text(
                bulan,
                style: const TextStyle(
                  fontSize: 13,
                  color: ColorApp.gray,
                ),
              ),
            ],
          ),
          SizeApp.h10,
          SizeApp.wFull,
          Text(
            jumlahPem,
            style: const TextStyle(
              fontSize: 13,
              color: ColorApp.gray,
            ),
          ),
        ],
      )),
    );
  }
}
