import '../../../../../domain/core/core.dart';

class CardNaiveBayes extends GetView<HomeController> {
  const CardNaiveBayes({
    super.key,
    required this.naiveBayesModel,
  });

  final NaiveBayesModel naiveBayesModel;

  @override
  Widget build(BuildContext context) {
    final methodApp = MethodApp();
    return StreamBuilder(
      stream: methodApp
          .kamar(
            naiveBayesModel.idKamar!.id,
          )
          .snapshots(),
      builder: (ctx, s) {
        if (s.hasData) {
          final data = s.data!.data()!;
          return StreamBuilder(
            stream: methodApp
                .penghuni(
                  data.penghuni!.first.id,
                )
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final dataPenghuni = snapshot.data!.data()!;
                final sewaBulanan =
                    controller.formatRupiah('${data.sewaBulanan}');

                return GestureDetector(
                  onTap: () {
                    // Get.to(
                    //   DetailKamar(
                    //     kamarModel: data,
                    //     naiveBayesModel: jatuhTempoModel,
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(12),
                    height: 180.0,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.orange,
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
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 16),
                          height: Get.height,
                          decoration: const BoxDecoration(
                            color: ColorApp.grayForm,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: AvatarWidget(
                            imageHash: dataPenghuni.image,
                            width: 107,
                            height: dataPenghuni.image != null ? 189 : 100,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.kamar,
                                ),
                                SizeApp.w8,
                                Text(
                                  'No. ${data.id!}',
                                  style: const TextStyle(
                                    color: ColorApp.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizeApp.h10,
                            Text(
                              dataPenghuni.nama,
                              style: const TextStyle(
                                color: ColorApp.white,
                                fontSize: 16,
                              ),
                            ),
                            SizeApp.h20,
                            Text(
                              dataPenghuni.status,
                              style: const TextStyle(
                                color: ColorApp.white,
                              ),
                            ),
                            SizeApp.h12,
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.lantai,
                                ),
                                SizeApp.w8,
                                Text(
                                  data.lantai!,
                                  style: const TextStyle(
                                    color: ColorApp.white,
                                  ),
                                ),
                                SizeApp.w20,
                                SvgPicture.asset(
                                  Assets.gedung,
                                ),
                                SizeApp.w8,
                                Text(
                                  data.gedung!,
                                  style: const TextStyle(
                                    color: ColorApp.white,
                                  ),
                                ),
                              ],
                            ),
                            SizeApp.h18,
                            RichText(
                              text: TextSpan(
                                text: '$sewaBulanan ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorApp.white,
                                  fontSize: 20,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: '/ bulan',
                                    style: TextStyle(
                                      color: ColorApp.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const Center(
                child: Text("Proses ..."),
              );
            },
          );
        }
        return const Center(
          child: Text("Masih Kosong"),
        );
      },
    );
  }
}
