// ignore_for_file: file_names

import 'dart:typed_data';

class UrunModel {
  late final int id;
  late final String urunAdi;
  late final String barkodNo;
  late final int urunAdet;
  late final String urunAciklama;
  late final Uint8List? urunFoto;

  UrunModel(
      {required this.id,
      required this.urunAdi,
      required this.barkodNo,
      required this.urunAdet,
      required this.urunAciklama,
      required this.urunFoto});

  factory UrunModel.fromMap(Map<String, dynamic> map) {
    return UrunModel(
      id: map['id'] ?? "",
      urunAdi: map['urunAdi'] ?? "",
      barkodNo: map['barkodNo'] ?? "",
      urunAdet: map['urunAdet'] ?? "",
      urunAciklama: map['urunAciklama'] ?? "",
      // Fotoğraf verisi eğer null değilse direkt atama yapılıyor, null ise null bırakılıyor
      urunFoto: map['urunFoto'],
    );
  }
}
