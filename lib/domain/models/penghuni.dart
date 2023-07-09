import '../core/core.dart';

class PenghuniModel {
  final String? id;
  final ImageHash? image;
  final String nama;
  final String? noHp;
  final String jkl;
  final String status;
  final String? peran;
  final bool? isAktif;
  PenghuniModel({
    this.id,
    this.image,
    required this.nama,
    required this.noHp,
    required this.jkl,
    required this.status,
    this.peran,
    this.isAktif,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'nama': nama,
      'noHp': noHp,
      'jkl': jkl,
      'status': status,
      'peran': peran,
      'isAktif': isAktif,
    };
  }

  factory PenghuniModel.fromMap(Map<String, dynamic> map) {
    return PenghuniModel(
      image: map['image'] != null ? map['image'] as ImageHash : null,
      nama: map['nama'] as String,
      noHp: map['noHp'] as String,
      jkl: map['jkl'] as String,
      status: map['status'] as String,
      peran: map['peran'] != null ? map['peran'] as String : "Kosong",
      isAktif: map['isAktif'] != null ? map['isAktif'] as bool : false,
    );
  }
  factory PenghuniModel.fromMapId(Map<String, dynamic> map, String id) {
    return PenghuniModel(
      id: id,
      image: map['image'] != null ? map['image'] as ImageHash : null,
      nama: map['nama'] as String,
      noHp: map['noHp'] != null ? map['noHp'] as String : "Kosong",
      jkl: map['jkl'] != null ? map['jkl'] as String : "Kosong",
      status: map['status'] as String,
      peran: map['peran'] != null ? map['peran'] as String : "Kosong",
      isAktif: map['isAktif'] != null ? map['isAktif'] as bool : false,
    );
  }
  factory PenghuniModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> data,
  ) {
    Map<String, dynamic> json = data.data()!;
    return PenghuniModel.fromMapId(json, data.id);
  }
}
