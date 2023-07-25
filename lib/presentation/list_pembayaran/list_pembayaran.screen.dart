import 'dart:developer';

// import 'package:grouped_list/grouped_list.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:manajemen_kost_by_user/presentation/list_pembayaran/components/detail_pemasukan.dart';
import 'package:manajemen_kost_by_user/presentation/list_pembayaran/components/value_grub.dart';
import 'package:manajemen_kost_by_user/presentation/profile/components/grub_separator.dart';

import '../../domain/core/core.dart';

class ListPembayaranScreen extends GetView<ListPembayaranController> {
  const ListPembayaranScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBack('Pembayaran'),
      body: controller.obx(
        (data) {
          final state = data!
              .where(
                (e) => e.idKamar.id == ConstansApp.idKamarLogin,
              )
              .toList();
          return GroupedListView<PembayaranModel, String>(
            elements: state,
            groupBy: (e) => controller.groupBy(e),
            groupComparator: (value1, value2) => value2.compareTo(value1),
            itemComparator: (item1, item2) => item1.idr.compareTo(item2.idr),
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (String value) => GroupSeparator(
              value,
              onTap: () {
                Get.to(RekapanPemasukanBulanan(
                  title: value,
                ));
                log(value);
              },
            ),
            itemBuilder: (c, e) => ValueGrubPembayaran(
              e,
              onTap: () {
                Get.to(DetailPembayaran(e: e));
              },
            ),
          );
        },
        onEmpty: const Center(child: Text("Masih Kosong")),
        onLoading: const LoadingState(),
        onError: (e) {
          return Center(child: Text("error : $e"));
        },
      ),
    );
  }
}

class RekapanPemasukanBulanan extends GetView<ListPembayaranController> {
  const RekapanPemasukanBulanan({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FormPembayaranController());
    final formC = Get.find<FormPembayaranController>();
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: appBarBack('Rekapan $title'),
      body: controller.obx(
        (dataP) {
          final state = dataP!
              .where(
                (e) => e.idKamar.id == formC.dataKamar.first.id,
              )
              .toList();
          final threeDigits = controller.threeDigits(title);
          int monthNumber = -1;
          for (int i = 0; i < controller.listNameMonth.length; i++) {
            if (controller.listNameMonth[i].startsWith(threeDigits)) {
              monthNumber = i + 1; // Menggunakan indeks + 1 sebagai nilai bulan
              break;
            }
          }
          final data = state.where((e) {
            return e.dateUpload.toDate().month == monthNumber;
          }).toList();
          int valueTotalBulanan = 0;
          // for (int i = 0; i < data.length; i++) {
          for (var e in data) {
            final bulanan = e.idr;
            valueTotalBulanan = valueTotalBulanan + bulanan;
          }
          final totalBulanan = controller.formatRupiah("$valueTotalBulanan");
          // }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final value = data[index];
                    final idr = controller.formatRupiah("${value.idr}");
                    return ListTile(
                      title: Text(value.jenis),
                      subtitle: Text("tgl ${value.dateUpload.toDate().day}"),
                      trailing: Text(
                        idr,
                        style: const TextStyle(
                          color: ColorApp.blackText,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Card(
                elevation: 10,
                color: ColorApp.orange,
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text('Total Pemasukan'),
                      const Spacer(),
                      Text(
                        ':   ${totalBulanan.replaceAll('+', '')}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        onEmpty: const Center(child: Text("Masih Kosong")),
        onLoading: const LoadingState(),
        onError: (e) {
          return Center(child: Text("error : $e"));
        },
      ),
    );
  }
}
