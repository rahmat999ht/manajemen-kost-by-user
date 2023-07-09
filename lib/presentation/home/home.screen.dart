import 'package:manajemen_kost_by_user/presentation/home/components/value_penjaga_kost.dart';

import '../../domain/core/core.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<KamarController>(
      () => KamarController(),
    );
    Get.lazyPut<PenjagaKostController>(
      () => PenjagaKostController(),
    );
    final cKamarKosong = Get.find<KamarController>();
    final cPenjagaKost = Get.find<PenjagaKostController>();
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        title: const HeaderHome(),
        backgroundColor: ColorApp.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ValueNaiveBayes(),
            const ValueRiwayatPembayaran(
              title: 'Riwayat Pembayaran',
            ),
            ValuePenjagaKost(
              title: 'Penjaga Kost',
              controller: cPenjagaKost,
            ),
            ValueKamarKosong(
              title: "Kamar Kosong",
              controller: cKamarKosong,
            ),
          ],
        ),
      ),
    );
  }
}
