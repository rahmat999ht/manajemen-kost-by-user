import 'dart:developer';

import 'package:manajemen_kost_by_user/domain/core/core.dart';

class PenjagaKostController extends GetxController with StateMixin<AdminModel> {
  List<AdminModel> listAmin = [];
  // AdminModel? AdminModel = null;

  Stream<QuerySnapshot<Map<String, dynamic>>> get adminStream =>
      ConstansApp.firebaseFirestore
          .collection(ConstansApp.adminCollection)
          .snapshots();

  @override
  void onInit() {
    adminStream.listen((event) {
      if (event.size == 0) {
        log("empty");
        change(null, status: RxStatus.empty());
      } else {
        listAmin = List.generate(event.docs.length, (index) {
          final data = event.docs[index];
          log("data jatuh tempo ${data.data()}");
          return AdminModel.fromDocumentSnapshot(data);
        });
        log("naive bayes ${listAmin.length}");
        final listWhere = listAmin.firstWhere(
          (e) => e.id == "BaEHJHYSl22x8NX6okHa",
        );
        log("listWhere $listWhere");
        change(listWhere, status: RxStatus.success());
      }
    });
    super.onInit();
  }
}
