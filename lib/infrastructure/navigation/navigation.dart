import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/core.screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: DashboardControllerBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardScreen(),
      binding: DashboardControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: DashboardControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE_UPDATE,
      page: () => const ProfileUpdateScreen(),
      binding: ProfileUpdateControllerBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeScreen(),
      binding: WelcomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.VERIFIKASI,
      page: () => const VerifikasiScreen(),
      binding: VerifikasiControllerBinding(),
    ),
    GetPage(
      name: Routes.PEMBAYARAN,
      page: () => const PembayaranScreen(),
      binding: PembayaranControllerBinding(),
    ),
    GetPage(
      name: Routes.FORM_PEMBAYARAN,
      page: () => const FormPembayaranScreen(),
      binding: FormPembayaranControllerBinding(),
    ),
    GetPage(
      name: Routes.LIST_PEMBAYARAN,
      page: () => const ListPembayaranScreen(),
      binding: ListPembayaranControllerBinding(),
    ),
    GetPage(
      name: Routes.TENTANG_APP,
      page: () => const TentangAppScreen(),
      binding: TentangAppControllerBinding(),
    ),
  ];
}
