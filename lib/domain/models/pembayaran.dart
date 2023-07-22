// ignore_for_file: public_member_api_docs, sort_constructors_first

import '/domain/core/core.dart';

class PembayaranModel {
  final String? id;
  final Timestamp dateUpload;
  final ImageHash foto;
  final String jenis;
  final int idr;
  final DocumentReference idKamar;
  // final DocumentReference? idPenghuni;
  PembayaranModel({
    this.id,
    required this.dateUpload,
    required this.foto,
    required this.jenis,
    required this.idr,
    required this.idKamar,
    // required this.idPenghuni,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateUpload': dateUpload,
      'foto': foto.toJson(),
      'jenis': jenis,
      'idr': idr,
      'idKamar': idKamar,
      // 'idPenghuni': idPenghuni,
    };
  }

  factory PembayaranModel.fromMapById(Map<String, dynamic> map, String id) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    // final dataLogin = map['idPenghuni'] as DocumentReference;
    // DocumentReference<PenghuniModel> idPenghuni = dataLogin.withConverter(
    //   fromFirestore: (snapshot, options) =>
    //       PenghuniModel.fromDocumentSnapshot(snapshot),
    //   toFirestore: (value, options) => value.toMap(),
    // );
    return PembayaranModel(
      id: id,
      dateUpload: map['dateUpload'] as Timestamp,
      foto: ImageHash.fromJson(map['foto'] as Map<String, dynamic>),
      jenis: map['jenis'] as String,
      idr: map['idr'] as int,
      idKamar: idKamar,
      // idPenghuni: map['idPenghuni'] == null ? null : idPenghuni,
    );
  }

  factory PembayaranModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return PembayaranModel.fromMapById(data, snapshot.id);
  }
}
