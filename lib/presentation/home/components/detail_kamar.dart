import 'package:collection/collection.dart';

import '../../../domain/core/core.dart';
import '../../pemberitahuan/components/call_by.dart';

class DetailKamar extends StatelessWidget {
  const DetailKamar({
    super.key,
    required this.naiveBayesModel,
  });

  final NaiveBayesModel naiveBayesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBack('No. ${naiveBayesModel.idKamar!.id}'),
      body: _dataKamar(),
    );
  }

  Widget _dataKamar() {
    final methodApp = MethodApp();
    return StreamBuilder<DocumentSnapshot<KamarModel>>(
      stream: methodApp.kamar(naiveBayesModel.idKamar!.id).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.data()!;
          return Column(
            children: [
              ...data.penghuni!.mapIndexed(
                (i, e) => StreamBuilder<DocumentSnapshot<PenghuniModel>>(
                  stream: methodApp.penghuni(data.penghuni![i].id).snapshots(),
                  builder: (ctx, s) {
                    if (s.hasData) {
                      final penghuniModel = s.data!.data()!;
                      return ListTile(
                        leading: AvatarWidget(
                          height: 43,
                          width: 43,
                          heightPlus: 0,
                          imageHash: penghuniModel.image,
                        ),
                        title: Text(
                          penghuniModel.nama,
                        ),
                        subtitle: Text(
                          penghuniModel.peran!,
                        ),
                        trailing: GestureDetector(
                          onTap: () async {
                            await callBy(
                              ctx,
                              penghuniModel.noHp,
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
                      );
                    } else {
                      return const Text(
                        'Proses ...',
                        style: TextStyle(
                          color: ColorApp.blackText,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      );
                    }
                  },
                ),
              ),
              _fasilitas(
                title: 'Fasilitas',
                kamarModel: data,
              ),
              _deskripsi(
                title: 'Deskripsi',
                kamarModel: data,
                jatuhTempo: naiveBayesModel.tglJatuhTempo,
              ),
            ],
          );
        } else {
          return const Text(
            'Proses ...',
            style: TextStyle(
              color: ColorApp.blackText,
              fontSize: 14,
              height: 1.5,
            ),
          );
        }
      },
    );
  }

  Widget _fasilitas({
    final String? title,
    final KamarModel? kamarModel,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: const TextStyle(
              color: ColorApp.blackText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.all(0),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: kamarModel!.fasilitas!.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 185,
              childAspectRatio: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              final data = kamarModel.fasilitas![index];
              return Row(
                children: [
                  SizeApp.w10,
                  const Icon(
                    Icons.album,
                    size: 10,
                  ),
                  SizeApp.w10,
                  Text(
                    data,
                    style: const TextStyle(
                      color: ColorApp.blackText,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _deskripsi({
    final String? title,
    final KamarModel? kamarModel,
    final Timestamp? jatuhTempo,
    // final KamarModel? kamarModel,
  }) {
    final day = initDay(jatuhTempo!);
    final month = initMonth(jatuhTempo);
    final year = inityear(jatuhTempo);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: Get.width),
          Text(
            title!,
            style: const TextStyle(
              color: ColorApp.blackText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                details(
                  'Sewa bulanan',
                  formatRupiah('${kamarModel!.sewaBulanan}'),
                ),
                const SizedBox(height: 12),
                details(
                  'Sewa tahunan',
                  formatRupiah('${kamarModel.sewaTahunan}'),
                ),
                const SizedBox(height: 12),
                details(
                  'Tgl jatuh tempo',
                  '$day - $month -$year',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row details(String title, String subTitle) {
    return Row(
      children: [
        const Icon(Icons.album, size: 10),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: ColorApp.blackText,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Text(
          subTitle,
          style: const TextStyle(
            color: ColorApp.blackText,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  int initDay(Timestamp time) {
    final value = time.toDate().day;
    return value;
  }

  int initMonth(Timestamp time) {
    final value = time.toDate().month;
    return value;
  }

  int inityear(Timestamp time) {
    final value = time.toDate().year;
    return value;
  }

  String formatRupiah(String amount) {
    final formattedAmount = amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match.group(1)}.');
    return '+Rp $formattedAmount';
  }
}
