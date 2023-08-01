import 'dart:developer';
import 'dart:io';

import 'package:manajemen_kost_by_user/presentation/form_pembayaran/controllers/image_pemasukan.controller.dart';

import '../../../domain/core/core.dart';
import '../components/alert_form_jenis.dart';
import '../components/alert_form_kamar.dart';

class FormPembayaranController extends GetxController
    with StateMixin<List<KamarModel>> {
  final methodApp = MethodApp();
  final formKey = GlobalKey<FormState>();
  final jenisC = TextEditingController();
  final kamarC = TextEditingController();
  final idrC = TextEditingController();
  List<KamarModel> listKamarTerisi = [];
  final loading = false.obs;

  void loadingState() {
    loading.value = !loading.value;
  }

  final listJenis = [
    'Air',
    'Listrik',
  ];

  Future alartJenis() async {
    await alertFormJenis(
      title: "Jenis Pemasukan",
      listValue: listJenis,
      textC: jenisC,
    );
  }

  Future alartKamar(List<KamarModel> listKamar) async {
    await alertFormKamar(
      title: "Kamar",
      listValue: listKamar,
      textC: kamarC,
    );
  }

  Future addPemasukan() async {
    try {
      if (formKey.currentState!.validate()) {
        final dataImage = Get.find<ImagesPembayaranController>();
        final idr = idrC.text.replaceAll('Rp', '');
        final fixIdr = idr.replaceAll(',', '');
        log(fixIdr);
        if (dataImage.imageFileList.isNotEmpty) {
          loadingState();
          final foto = await methodApp.uploadImagePemasukan(
            File(dataImage.imageFileList.first.path),
            "${ConstansApp.idLogin}_${DateTime.now().toIso8601String()}",
          );
          DocumentReference<KamarModel> idKamar = methodApp.kamar(kamarC.text);
          // DocumentReference<PenghuniModel> idPenghuni =
          //     methodApp.penghuni(ConstansApp.idLogin);
          methodApp.addPemasukan(
            data: PembayaranModel(
              foto: foto,
              jenis: jenisC.text,
              idr: int.parse(fixIdr),
              idKamar: idKamar,
              // idPenghuni: idPenghuni,
              dateUpload: Timestamp.now(),
            ).toMap(),
          );
          dataImage.removeImage(0);
          Get.back();
          loadingState();
        } else {
          Get.snackbar('Info', "Tolong tambahkan Nota");
        }
      } else {
        Get.snackbar('Info', "Tolong isi semua form");
      }
    } catch (e) {
      Get.snackbar('Info', "Pesan Error : $e");
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get getListKamar =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.kamarCollection)
          .where('penghuni', isNotEqualTo: []).snapshots();

  var dataKamar = <KamarModel>[];

  @override
  void onInit() {
    getListKamar.listen((event) {
      if (event.size != 0) {
        listKamarTerisi = List.generate(
          event.docs.length,
          (index) => KamarModel.fromDocumentSnapshot(event.docs[index]),
        ).toList();
        dataKamar = listKamarTerisi
            .where(
              (e) => e.penghuni!.first.id == ConstansApp.idLogin,
            )
            .toList();
        kamarC.text = dataKamar.first.id!;
        log('${listKamarTerisi.length}', name: 'kamar');
        change(listKamarTerisi, status: RxStatus.success());
      } else {
        log('Kosong', name: 'kamar');
        change([], status: RxStatus.empty());
      }
    });
    super.onInit();
  }
}
