// ignore_for_file: file_names

class DepoModel {
  late final int id;
  late final String depoAdi;
  late final String depoTelNo;
  late final String depoSehir;
  late final String depoAdres;

  DepoModel(
      {required this.id,
      required this.depoAdi,
      required this.depoTelNo,
      required this.depoSehir,
      required this.depoAdres});

  factory DepoModel.fromMap(Map<String, dynamic> map) {
    return DepoModel(
        id: map['id'] ?? "",
        depoAdi: map['depoAdi'] ?? "",
        depoTelNo: map['depoTelNo'] ?? "",
        depoSehir: map['depoSehir'] ?? "",
        depoAdres: map['depoAdres'] ?? "");
  }
}
