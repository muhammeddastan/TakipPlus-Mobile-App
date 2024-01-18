class GelirModel {
  late final int id;
  late final String gelirAdi;
  late final String gelirTip;
  late final String gelirPara;
  late final String gelirTarih;

  GelirModel(
      {required this.id,
      required this.gelirAdi,
      required this.gelirTip,
      required this.gelirPara,
      required this.gelirTarih});

  factory GelirModel.fromMap(Map<String, dynamic> map) {
    return GelirModel(
      id: map['id'] ?? "",
      gelirAdi: map['gelirAdi'] ?? "",
      gelirTip: map['gelirTip'] ?? "",
      gelirPara: map['gelirPara'] ?? "",
      gelirTarih: map['gelirTarih'] ?? "",
    );
  }
}
