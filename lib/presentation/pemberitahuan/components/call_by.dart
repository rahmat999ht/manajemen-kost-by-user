import 'package:manajemen_kost_by_user/presentation/home/components/card_contact_by.dart';
import 'package:manajemen_kost_by_user/presentation/pemberitahuan/components/bottom_sheet.dart';

import '../../../domain/core/core.dart';

Future callBy(BuildContext context, String? noHp) async {
  MethodApp methodApp = MethodApp();
  return await buttonSheet(
    context: context,
    title: "Hubungi Lewat",
    content: <Widget>[
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
  );
}
