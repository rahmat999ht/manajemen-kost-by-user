// ignore_for_file: constant_identifier_names

class Routes {
  static Future<String> get initialRoute async {
    return WELCOME;
  }

  static const DASHBOARD = '/dashboard';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PEMBAYARAN = '/pembayaran';
  static const PROFILE = '/profile';
  static const PROFILE_UPDATE = '/profile-update';
  static const VERIFIKASI = '/verifikasi';
  static const WELCOME = '/welcome';
  static const FORM_PEMBAYARAN = '/form-pembayaran';
}
