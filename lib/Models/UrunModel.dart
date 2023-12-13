class UrunModel {
  late final String urunAdi;
  late final int urunFiyati;
  late final int urunAdet;
  late final DateTime urunTarih;
  late final bool bakimVarMi;

  UrunModel(
      {required this.urunAdi,
      required this.urunFiyati,
      required this.urunAdet,
      required this.urunTarih,
      required this.bakimVarMi});
}
