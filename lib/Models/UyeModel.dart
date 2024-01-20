// ignore_for_file: file_names

class UyeModel {
  late final int id;
  late final String uyeAdSoyad;
  late final String uyeEposta;
  late final String uyeSifre;

  UyeModel({
    required this.id,
    required this.uyeAdSoyad,
    required this.uyeEposta,
    required this.uyeSifre,
  });
  factory UyeModel.fromMap(Map<String, dynamic> map) {
    return UyeModel(
      id: map['id'] ?? "",
      uyeAdSoyad: map['uyeAdSoyad'] ?? "",
      uyeEposta: map['uyeEposta'] ?? "",
      uyeSifre: map['uyeSifre'] ?? "",
    );
  }
}
