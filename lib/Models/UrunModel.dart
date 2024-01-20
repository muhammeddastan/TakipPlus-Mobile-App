// ignore_for_file: file_names

import 'dart:typed_data';

class UrunModel {
  final int id;
  final String urunAdi;
  final String barkodNo;
  final int urunAdet;
  final String urunAciklama;
  final Uint8List? urunFoto;

  UrunModel(
      {required this.id,
      required this.urunAdi,
      required this.barkodNo,
      required this.urunAdet,
      required this.urunAciklama,
      required this.urunFoto});

  factory UrunModel.fromMap(Map<String, dynamic> map) {
    print(map['urunAdet']);
    return UrunModel(
      id: map['id'] ?? "",
      urunAdi: map['urunAdi'] ?? "",
      barkodNo: map['barkodNo'] ?? "",
      urunAdet: map['urunAdet'] ?? "",
      urunAciklama: map['urunAciklama'] ?? "",
      urunFoto: map['urunFoto'],
    );
  }
}
