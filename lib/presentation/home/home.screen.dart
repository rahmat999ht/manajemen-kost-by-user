import 'package:manajemen_kost_by_user/domain/models/pemberitahuan.dart';
import 'package:manajemen_kost_by_user/presentation/home/components/value_penjaga_kost.dart';
import 'package:manajemen_kost_by_user/presentation/pemberitahuan/controllers/pemberitahuan.controller.dart';

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
        actions: const [Acions()],
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

class Acions extends GetView<PemberitahuanController> {
  const Acions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<PemberitahuanController>(
      () => PemberitahuanController(),
      // permanent: true,
    );
    return controller.obx(
      (state) => data(state!),
      onEmpty: const Padding(
        padding: EdgeInsets.only(right: 20, top: 8),
        child: Icon(Icons.notifications_active_outlined),
      ),
      onLoading: const SizedBox(height: 130, child: LoadingState()),
      onError: (e) {
        return Center(child: Text("pesan error : $e"));
      },
    );
  }

  Widget data(List<PemberitahuanModel> data) {
    final dataPemberitahuan = data.where((e) => e.isView == false).toList();
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 22),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.PEMBERITAHUAN);
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            const Icon(
              Icons.notifications_active_outlined,
              // size: 28,
            ),
            dataPemberitahuan.isNotEmpty
                ? const Card(
                    color: ColorApp.red,
                    child: SizedBox(
                      height: 8,
                      width: 8,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
