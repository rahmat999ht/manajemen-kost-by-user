import 'dart:developer';
import 'dart:io';

import '../../../domain/core/core.dart';

class ProfileUpdateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController namaC = TextEditingController();
  TextEditingController noHpC = TextEditingController();
  TextEditingController jkC = TextEditingController();
  TextEditingController statusC = TextEditingController();
  final methodApp = MethodApp();
  final listJK = <String>[
    'Laki-laki',
    'Perempuan',
  ];
  final listStatus = [
    'Mahasiswa',
    'Karyawan',
    'Wiraswasta',
    'Lainnya',
  ];
  Future alertJK() async {
    await alertValueProfilUpdate(
      title: "Jenil Kelamin",
      listValue: listJK,
      textC: jkC,
    );
  }

  Future alertStatus() async {
    await alertValueProfilUpdate(
      title: "Status",
      listValue: listStatus,
      textC: statusC,
    );
  }

  late final PenghuniModel penghuniModel;
  final isLoading = false.obs;

  void initLoading() {
    isLoading.value = !isLoading.value;
  }

  Future updateProfil() async {
    try {
      if (formKey.currentState!.validate()) {
        final dataImage = Get.find<ImageProfileUpdateController>();
        if (dataImage.imageFileList.isNotEmpty || penghuniModel.image != null) {
          initLoading();
          log('masuk');
          log(' image : ${dataImage.imageFileList.length}');
          if (dataImage.imageFileList.isNotEmpty) {
            final foto = await methodApp.uploadImageProfil(
              File(dataImage.imageFileList.first.path),
              "${ConstansApp.idLogin}_${DateTime.now().toIso8601String()}",
            );
            log('masuk 1 ${dataImage.imageFileList.length}');
            log(penghuniModel.id!);
            ConstansApp.firebaseFirestore
                .collection(ConstansApp.penghuniCollection)
                .doc(penghuniModel.id)
                .update(
                  PenghuniModel(
                    image: foto,
                    nama: namaC.text,
                    noHp: noHpC.text,
                    jkl: jkC.text,
                    status: statusC.text,
                  ).toMap(),
                );
            Get.back();
          } else {
            log('masuk 2');
            ConstansApp.firebaseFirestore
                .collection(ConstansApp.penghuniCollection)
                .doc(penghuniModel.id)
                .update(
                  PenghuniModel(
                    image: penghuniModel.image,
                    nama: namaC.text,
                    noHp: noHpC.text,
                    jkl: jkC.text,
                    status: statusC.text,
                  ).toMap(),
                );
            Get.back();
          }
          initLoading();
        } else {
          Get.snackbar('Info', "Tolong tambahkan Image");
        }
      } else {
        Get.snackbar('Info', "Tolong isi semua form");
      }
    } catch (e) {
      Get.snackbar('Info', "Pesan Error : $e");
    }
  }

  @override
  void onInit() {
    penghuniModel = Get.arguments;
    initForm(
      nama: penghuniModel.nama,
      noHp: penghuniModel.noHp,
      jk: penghuniModel.jkl,
      status: penghuniModel.status,
    );
    log(Get.arguments.toString());
    super.onInit();
  }

  void initForm({
    final String? nama,
    final String? noHp,
    final String? jk,
    final String? status,
  }) {
    nama == null ? "" : namaC.text = nama;
    noHp == null ? "" : noHpC.text = noHp;
    jk == null ? "" : jkC.text = jk;
    status == null ? "" : statusC.text = status;
  }
}
