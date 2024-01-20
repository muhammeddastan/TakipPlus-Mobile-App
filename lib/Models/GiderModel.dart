class GiderModel {
  late final int id;
  late final String giderAdi;
  late final String giderTip;
  late final int giderPara;
  late final String giderTarih;

  GiderModel(
      {required this.id,
      required this.giderAdi,
      required this.giderTip,
      required this.giderPara,
      required this.giderTarih});

  factory GiderModel.fromMap(Map<String, dynamic> map) {
    return GiderModel(
      id: map['id'] ?? "",
      giderAdi: map['giderAdi'] ?? "",
      giderTip: map['giderTip'] ?? "",
      giderPara: int.parse(map['giderPara'].toString()),
      giderTarih: map['giderTarih'] ?? "",
    );
  }
}
