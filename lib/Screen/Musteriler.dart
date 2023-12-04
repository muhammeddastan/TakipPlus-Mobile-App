import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/MusteriModel.dart';
import 'package:takip_plus/Pages/MusteriDetayPage.dart';

class MusterilerScreen extends StatefulWidget {
  const MusterilerScreen({super.key});

  @override
  State<MusterilerScreen> createState() => _MusterilerScreenState();
}

class _MusterilerScreenState extends State<MusterilerScreen> {
  final List<MusteriModel> Musteriler = [
    MusteriModel(
        adi: "Muhammed",
        soyad: "Daştan",
        adres: "ASD mah. ASDA sk. No:11 D:3",
        telNo: "05512345678",
        urunAdi: "SAD ÜRÜN",
        urunFiyati: 3900,
        bakimOlacakMi: false),
    MusteriModel(
        adi: "Serhat",
        soyad: "Güneş",
        adres: "BAC mah. DAFG sk. No:11 D:5",
        telNo: "01234567890",
        urunAdi: "ASD ÜRÜN",
        urunFiyati: 2800,
        bakimOlacakMi: true),
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
                title:
                    Text('${Musteriler[index].adi} ${Musteriler[index].soyad}'),
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
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
