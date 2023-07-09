import '../../../domain/core/core.dart';

class CardPenjagaKost extends StatelessWidget {
  const CardPenjagaKost({
    super.key,
    this.adminModel,
  });

  final AdminModel? adminModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 100.0,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(10.0, 10.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Center(
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  // height: Get.height,
                  decoration: const BoxDecoration(
                    color: ColorApp.grayForm,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: AvatarWidget(
                    imageHash: adminModel!.foto,
                    width: 70,
                    height: 70,
                    radius: 10,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${adminModel?.nama}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.blackText,
                      ),
                    ),
                    SizeApp.h10,
                    Text(
                      '${adminModel?.noHp}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: ColorApp.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                await callBy(
                  adminModel?.noHp,
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Icon(
                      Icons.phone,
                      color: ColorApp.green,
                    ),
                  ),
                ),
              ),
            ),
            SizeApp.w10,
          ],
        ),
      ),
    );
  }
}
