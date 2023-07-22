import 'dart:developer';

import '../../../domain/core/core.dart';

class ProfileController extends GetxController {
  final methodApp = MethodApp();
  final listItem = <String>[
    'Personal details',
    'Pembayaran',
  ];

  var listAssetsItem = [
    Assets.person,
    Assets.pengeluaran2,
  ];

  void toPersonalDetails(PenghuniModel penghuni) {
    Get.toNamed(
      Routes.PROFILE_UPDATE,
      arguments: penghuni,
    );
  }

  void toPembayaran() {
    Get.toNamed(Routes.LIST_PEMBAYARAN);
  }

  void toTentangApp() {
    Get.toNamed(Routes.TENTANG_APP);
  }

  Future alertLogOut() async {
    await alertActions(
      'Peringatan',
      'apakah anda yakin ingin log-out',
      [
        // const Spacer(),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: tapLogOut,
          child: const Text('Ya'),
        ),
      ],
    );
  }

  Future tapLogOut() async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_id", 'id');
    String? isId = prefs.getString("user_id") ?? 'id';
    log(isId);
    Get.offAllNamed(Routes.LOGIN);
  }
}
