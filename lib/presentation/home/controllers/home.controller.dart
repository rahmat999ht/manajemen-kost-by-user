import 'dart:developer';

import 'package:manajemen_kost_by_user/domain/core/core.dart';

class HomeController extends GetxController with StateMixin<NaiveBayesModel> {
  String formatRupiah(
    String amount, {
    bool rp = true,
  }) {
    final formattedAmount = amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match.group(1)}.');
    if (rp == false) {
      return formattedAmount;
    } else {
      return 'Rp.$formattedAmount';
    }
  }

  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agu',
    'Sep',
    'Nov',
    'Des',
  ];
  final tglSkrg = Timestamp.now().toDate();

  List<NaiveBayesModel> listNaiveBayes = [];
  // NaiveBayesModel? naiveBayesModel = null;

  Stream<QuerySnapshot<Map<String, dynamic>>> get penghuniStream =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.naiveBayesCollection)
          .snapshots();

  @override
  void onInit() {
    penghuniStream.listen((event) {
      if (event.size == 0) {
        log("empty");
        change(null, status: RxStatus.empty());
      } else {
        listNaiveBayes = List.generate(event.docs.length, (index) {
          final data = event.docs[index];
          log("data jatuh tempo ${data.data()}");
          return NaiveBayesModel.fromDocumentSnapshot(data);
        });
        log("naive bayes ${listNaiveBayes.length}");
        final listWhere = listNaiveBayes.firstWhere(
          (e) => e.idKamar!.id == "07 A",
        );
        log("listWhere $listWhere");
        change(listWhere, status: RxStatus.success());
      }
    });
    super.onInit();
  }
}
