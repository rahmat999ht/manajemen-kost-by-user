import 'package:manajemen_kost_by_user/presentation/home/components/card_contact_by.dart';

import '../../../domain/core/core.dart';

Future callByAlert(String? noHp) async {
  MethodApp methodApp = MethodApp();
  return await alertContent(
      title: "Hubungi Lewat",
      content: Column(
        children: <Widget>[
          CardContackBy(
            contackBy: 'Telegram',
            icon: Assets.imgTele,
            onTap: () async {
              await methodApp.launchTelegram(
                numberTele: noHp!.replaceAll("+62", "62"),
              );
            },
          ),
          SizeApp.h10,
          CardContackBy(
            contackBy: 'WhatsApp',
            icon: Assets.imgWa,
            onTap: () async {
              await methodApp.launchWhatsApp(
                numberWA: noHp!.replaceAll("+62", "62"),
                message: 'Halo',
              );
            },
          ),
        ],
      ));
}
