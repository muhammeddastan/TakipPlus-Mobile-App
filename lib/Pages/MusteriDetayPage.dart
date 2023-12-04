// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/MusteriModel.dart'; // MusteriModel import edildiğinden emin olmalısınız

class MusteriDetayPage extends StatelessWidget {
  final MusteriModel musteri;

  const MusteriDetayPage(
      {Key? key, required this.musteri, required MusteriModel Musteriler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.White,
      appBar: AppBar(
        title: Text("Müşteri Bilgileri"),
        foregroundColor: Renkler.White,
        backgroundColor: Renkler.Blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.person_alt_circle,
                          size: MediaQuery.of(context).size.height * 0.04,
                          color: Renkler.Blue,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Müşteri Bilgileri",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //MÜŞTERİ BİLGİLERİ
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 15),
                    child: Row(
                      children: [
                        const Text(
                          "Adı Soyadı:",
                          style: TextStyle(
                              color: Renkler.Blue,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${musteri.adi} ${musteri.soyad}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Adres: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          musteri.adres,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Telefon: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          musteri.telNo,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),

                  //ÜRÜN BİLGİLERİ
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            CupertinoIcons.cube_box,
                            size: MediaQuery.of(context).size.height * 0.04,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${musteri.urunAdi}",
                          style: TextStyle(
                              color: Renkler.Blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      'Ürün Fiyatı: ${musteri.urunFiyati}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10, bottom: 25),
                    child: Text(
                      musteri.bakimOlacakMi == true
                          ? 'Bakım Olacak Mı?: Evet'
                          : "Bakım Olacak Mı?: Hayır",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
