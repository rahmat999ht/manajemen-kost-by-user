import 'dart:developer';

import 'domain/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool? isviewed = prefs.getBool("isStart") ?? false;
  String? isId = prefs.getString("user_id") ?? 'id';
  log(prefs.getBool("isStart").toString());
  log(isId);
  String isLogin = isId == 'id' ? Routes.LOGIN : Routes.DASHBOARD;
  String initialRoute = isviewed == true ? isLogin : Routes.WELCOME;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.subscribeToTopic(isId);
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log('Got a message whilst in the foreground!');
    log('Message data: ${message.data}');

    if (message.notification != null) {
      log('Message also contained a notification: ${message.notification?.body ?? "body"}');
    }
  });

  // var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
