import '/domain/core/core.dart';

class NaiveBayesModel {
  final String? idNaiveBayes;
  final Timestamp? tglJatuhTempo;
  final DocumentReference? idKamar;
  final bool? statusKamar;
  final List<RiwayatPembayaran>? riwayatPembayaran;
  final bool? terisi;

  NaiveBayesModel({
    this.idNaiveBayes,
    required this.tglJatuhTempo,
    this.idKamar,
    this.statusKamar,
    this.riwayatPembayaran,
    this.terisi,
  });

  factory NaiveBayesModel.fromMap(Map<String, dynamic> map) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return NaiveBayesModel(
      tglJatuhTempo: map['tglJatuhTempo'] != null
          ? map['tglJatuhTempo'] as Timestamp
          : null,
      idKamar: idKamar,
      statusKamar:
          map['statusKamar'] != null ? map['statusKamar'] as bool : null,
      riwayatPembayaran: map['riwayatPembayaran'] != null
          ? List<RiwayatPembayaran>.from(
              (map['riwayatPembayaran']).map<RiwayatPembayaran?>(
                (x) => RiwayatPembayaran.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      terisi: map['terisi'] != null ? map['terisi'] as bool : null,
    );
  }

  factory NaiveBayesModel.fromMapByID(Map<String, dynamic> map, String id) {
    final dataKamar = map['idKamar'] as DocumentReference;
    DocumentReference<KamarModel> idKamar = dataKamar.withConverter(
      fromFirestore: (snapshot, options) =>
          KamarModel.fromDocumentSnapshot(snapshot),
      toFirestore: (value, options) => value.toMap(),
    );
    return NaiveBayesModel(
      idNaiveBayes: id,
      tglJatuhTempo: map['tglJatuhTempo'] != null
          ? map['tglJatuhTempo'] as Timestamp
          : null,
      idKamar: idKamar,
      statusKamar:
          map['statusKamar'] != null ? map['statusKamar'] as bool : null,
      riwayatPembayaran: map['riwayatPembayaran'] != null
          ? List<RiwayatPembayaran>.from(
              (map['riwayatPembayaran']).map<RiwayatPembayaran?>(
                (x) => RiwayatPembayaran.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      terisi: map['terisi'] != null ? map['terisi'] as bool : null,
    );
  }

  factory NaiveBayesModel.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return NaiveBayesModel.fromMapByID(data, snapshot.id);
  }
}
