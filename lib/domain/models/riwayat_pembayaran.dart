// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:manajemen_kost_by_user/domain/core/core.dart';

class RiwayatPembayaran {
  final Timestamp? dateUpload;
  final bool? isTahunan;
  final bool? isBermasalah;
  final String? tahun;
  final String? bulan;
  final int? sewaBulanan;
  final int? sewaTahunan;

  RiwayatPembayaran({
    this.dateUpload,
    this.isTahunan,
    this.isBermasalah,
    this.tahun,
    this.bulan,
    this.sewaBulanan,
    this.sewaTahunan,
  });

  Map<String, dynamic> toTahunan() {
    return <String, dynamic>{
      'dateUpload': dateUpload,
      'isTahunan': true,
      'isBermasalah': isBermasalah,
      'tahun': tahun,
      'bulan': null,
      'sewaBulanan': null,
      'sewaTahunan': sewaTahunan,
    };
  }

  Map<String, dynamic> toBulanan() {
    return <String, dynamic>{
      'dateUpload': dateUpload,
      'isTahunan': false,
      'isBermasalah': isBermasalah,
      'tahun': null,
      'bulan': bulan,
      'sewaBulanan': sewaBulanan,
      'sewaTahunan': null,
    };
  }

  factory RiwayatPembayaran.fromMap(Map<String, dynamic> map) {
    return RiwayatPembayaran(
      dateUpload:
          map['dateUpload'] != null ? map['dateUpload'] as Timestamp : null,
      isTahunan: map['isTahunan'] != null ? map['isTahunan'] as bool : null,
      isBermasalah:
          map['isBermasalah'] != null ? map['isBermasalah'] as bool : null,
      tahun: map['tahun'] != null ? map['tahun'] as String : null,
      bulan: map['bulan'] != null ? map['bulan'] as String : null,
      sewaBulanan:
          map['sewaBulanan'] != null ? map['sewaBulanan'] as int : null,
      sewaTahunan:
          map['sewaTahunan'] != null ? map['sewaTahunan'] as int : null,
    );
  }
}
