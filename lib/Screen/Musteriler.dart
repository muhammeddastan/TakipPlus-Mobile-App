import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/MusteriModel.dart';
import 'package:takip_plus/Models/UrunModel.dart';
import 'package:takip_plus/Pages/MusteriDetayPage.dart';

class MusterilerScreen extends StatefulWidget {
  const MusterilerScreen({super.key});

  @override
  State<MusterilerScreen> createState() => _MusterilerScreenState();
}

class _MusterilerScreenState extends State<MusterilerScreen> {
  final List<MusteriModel> Musteriler = [
    MusteriModel(
      adiSoyadi: "Muhammed Daştan",
      adres: "ASD mah. ASDA sk. No:11 D:3",
      telNo: "05512345678",
    ),
    MusteriModel(
      adiSoyadi: "Serhat Güneş",
      adres: "BAC mah. DAFG sk. No:11 D:5",
      telNo: "01234567890",
    )
  ];

  final List<UrunModel> Urunler = [
    UrunModel(
        urunAdi: "urunAdi",
        urunFiyati: 300,
        urunAdet: 1,
        urunTarih: DateTime(2023, 7, 2, 2, 2),
        bakimVarMi: false),
    UrunModel(
        urunAdi: "urunAdi",
        urunFiyati: 300,
        urunAdet: 1,
        urunTarih: DateTime(2023, 7, 2, 2, 2),
        bakimVarMi: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Renkler.White,
        appBar: AppBar(
          title: const Text("Müşteriler"),
          backgroundColor: Renkler.White,
        ),
        body: ListView.builder(
            itemCount: Musteriler.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(CupertinoIcons
                    .person_alt_circle_fill), // Sol taraftaki icon
                title: Text(Musteriler[index].adiSoyadi),
                subtitle: Text(Musteriler[index].adres), // Adres bilgisi
                trailing: const Icon(Icons.search), // Sağdaki ok iconu
                onTap: () {
                  // Müşteri detay sayfasına gitmek için onTap event'i
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MusteriDetayPage(
                        musteri: Musteriler[index],
                        Musteriler: Musteriler[index],
                        urun: Urunler[index],
                        Urunler: Urunler[index],
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
