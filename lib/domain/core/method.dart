import 'dart:developer';
import 'dart:io';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;

import '/domain/core/core.dart';

class MethodApp {
  void updateKamarById({
    String? noKamar,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.kamarCollection)
        .doc(noKamar)
        .update(
          data!,
        );
  }

  void setPenghuniById({
    String? idPenghuni,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .doc(idPenghuni)
        .set(data!);
  }

  void updatePenghuniById({
    String? idPenghuni,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .doc(idPenghuni)
        .update(data!);
  }

  void addNaiveBayes({
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.naiveBayesCollection)
        .add(data!);
  }

  void updateNaiveBayesById({
    String? idNaiveBayes,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.naiveBayesCollection)
        .doc(idNaiveBayes)
        .update(data!);
  }

  void addPemasukan({
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.pemasukanCollection)
        .add(data!);
  }

  void addPengeluaran({
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.pengeluaranCollection)
        .add(data!);
  }

   void updatePemberitahuanById({
    String? id,
    Map<String, dynamic>? data,
  }) {
    ConstansApp.firebaseFirestore
        .collection(ConstansApp.pemberitahuanCollection)
        .doc(id)
        .update(
          data!,
        );
  }


  DocumentReference<PenghuniModel> penghuni(String idUser) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.penghuniCollection)
        .doc(idUser)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                PenghuniModel.fromDocumentSnapshot(snapshot),
            toFirestore: (value, options) => value.toMap());
  }

  DocumentReference<KamarModel> kamar(String idKamar) {
    return ConstansApp.firebaseFirestore
        .collection(ConstansApp.kamarCollection)
        .doc(idKamar)
        .withConverter(
            fromFirestore: (snapshot, options) =>
                KamarModel.fromDocumentSnapshot(snapshot),
            toFirestore: (value, options) => value.toMap());
  }

  Future launchWhatsApp({required numberWA, required message}) async {
    final whatsappURl = 'https://wa.me/$numberWA?text=${Uri.parse("$message")}';
    log('https://wa.me/$numberWA?text=${Uri.parse("$message")}');
    if (await canLaunch(whatsappURl)) {
      await launch(whatsappURl);
    } else {
      Get.snackbar('info', "whatsapp no installed");
    }
  }

  Future launchTelegram({required numberTele}) async {
    var url = 'https://t.me/$numberTele';
    log('https://t.me/$numberTele');
    await canLaunch(url)
        ? await launch(url)
        : Get.snackbar('info', "Could not launch Telegram");
    // log('Could not launch Telegram');
  }

  String blurImage(File dataImage) {
    final data = dataImage.readAsBytesSync();
    final image = img.decodeImage(data);
    log(image.toString());
    final blurHash = BlurHash.encode(image!, numCompX: 4, numCompY: 3);
    return blurHash.hash;
  }

  Future<ImageHash> uploadWithImage(
    File file,
    String uniqName, {
    bool pemasukan = true,
    bool profil = false,
  }) async {
    final String folder = pemasukan == true ? 'pemasukan' : 'pengeluaran';
    final String initFolder = profil == true ? 'profil' : folder;
    final uploadTask =
        await ConstansApp.storageRef.child("$initFolder/$uniqName.jpg").putFile(
              file,
              ConstansApp.metadata,
            );
    final String urlImage = await uploadTask.ref.getDownloadURL();

    return ImageHash(
      imageHash: blurImage(file),
      imageUrl: urlImage,
    );
  }
}
