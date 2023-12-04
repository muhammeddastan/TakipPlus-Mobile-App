class MusteriModel {
  late final String adi;
  late final String soyad;
  late final String adres;
  late final String telNo;
  late final String urunAdi;
  late final int urunFiyati;
  final bool bakimOlacakMi;

  MusteriModel(
      {required this.adi,
      required this.soyad,
      required this.adres,
      required this.telNo,
      required this.urunAdi,
      required this.urunFiyati,
      required this.bakimOlacakMi});
}
