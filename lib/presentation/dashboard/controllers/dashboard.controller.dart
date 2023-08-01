import 'dart:async';
import 'dart:developer';

import 'package:manajemen_kost_by_user/domain/core/core.dart';

class DashboardController extends GetxController
    with StateMixin<PenghuniModel> {
  final RxInt selectedIndex = 0.obs;
  late List<Widget> widgetOptions = <Widget>[];
  bool toogle = true;
  final isLoading = true.obs;
  PenghuniModel? penghuniModel;
  late final List<PenghuniModel> dataPenghuni;

  void toPenbayaran() {
    Get.toNamed(Routes.FORM_PEMBAYARAN);
  }

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    String? isId = prefs.getString("user_id") ?? '';
    log(isId, name: 'user_id');

    final dataAllUser = await ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .get();
    dataPenghuni = dataAllUser.docs
        .map((e) => PenghuniModel.fromDocumentSnapshot(e))
        .toList();

    var dataUserModel = dataAllUser.docs.firstWhere((e) => e.id == isId);
    penghuniModel = PenghuniModel.fromDocumentSnapshot(dataUserModel);

    successState(penghuniModel!);

    Timer.periodic(const Duration(seconds: 3), (timer) {
      log(penghuniModel!.isAktif.toString());
      if (penghuniModel!.isAktif == false) {
        log('logout');
        logOut();
        timer.cancel();
      }
    });

    if (Get.arguments != null) {
      selectedIndex.value = Get.arguments["selectedIndex"] ?? 0;
    }
    widgetOptions = [
      const HomeScreen(),
      const ProfileScreen(),
    ];
    super.onInit();
  }

  void loadingState() {
    change(
      null,
      status: RxStatus.loading(),
    );
  }

  void successState(PenghuniModel penghuniModel) {
    change(
      penghuniModel,
      status: RxStatus.success(),
    );
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_id", 'id');
    String? isId = prefs.getString("user_id") ?? 'id';
    log(isId);
    Get.offAllNamed(Routes.LOGIN);
  }
}
