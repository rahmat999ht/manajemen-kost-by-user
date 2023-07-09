import 'dart:developer';

import 'package:get/get.dart';
import 'package:manajemen_kost_by_user/infrastructure/navigation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeController extends GetxController {
  final String kelola =
      "Nikmati Aplikasi khusus untuk penghuni di kost Esklusif kami";
  final String anda = "Anda selangkah lagi.";

  void tapStart() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isStart", true);
    log("tapStart");
    log(prefs.getBool("isStart").toString());
    Get.offAndToNamed(Routes.LOGIN);
  }
}
