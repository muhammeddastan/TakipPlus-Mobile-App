// ignore_for_file: file_names

class MusteriModel {
  late final int id;
  late final String musteriAdSoyad;
  late final String musteriTelNo;
  late final String musteriAdres;
  late final String musteriEposta;
  late final String musteriAciklama;

  MusteriModel(
      {required this.id,
      required this.musteriAdSoyad,
      required this.musteriTelNo,
      required this.musteriAdres,
      required this.musteriEposta,
      required this.musteriAciklama});

  factory MusteriModel.fromMap(Map<String, dynamic> map) {
    return MusteriModel(
        id: map['id'] ?? "",
        musteriAdSoyad: map['musteriAdSoyad'] ?? "",
        musteriTelNo: map['musteriTelNo'] ?? "",
        musteriAdres: map['musteriAdres'] ?? "",
        musteriEposta: map['musteriEposta'] ?? "",
        musteriAciklama: map['musteriAciklama'] ?? "");
  }
}
