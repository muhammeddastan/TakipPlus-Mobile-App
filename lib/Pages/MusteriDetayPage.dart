// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/MusteriModel.dart';
import 'package:takip_plus/Models/UrunModel.dart'; // MusteriModel import edildiğinden emin olmalısınız

class MusteriDetayPage extends StatelessWidget {
  final MusteriModel musteri;
  final UrunModel urun;

  const MusteriDetayPage(
      {Key? key,
      required this.musteri,
      required MusteriModel Musteriler,
      required this.urun,
      required UrunModel Urunler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.White,
      appBar: AppBar(
        title: const Text("Müşteri Bilgileri"),
        foregroundColor: Renkler.White,
        backgroundColor: Renkler.Blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                                color: Renkler.Grey,
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
                        Text(
                          "Adı Soyadı: ",
                          style: TextStyle(
                              color: Renkler.Black.withOpacity(0.3),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${musteri.adiSoyadi}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Renkler.Grey),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          'Adres: ',
                          style: TextStyle(
                            color: Renkler.Black.withOpacity(0.3),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          musteri.adres,
                          style: const TextStyle(
                              color: Renkler.Grey,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 15),
                    child: Row(
                      children: [
                        Text(
                          'Telefon: ',
                          style: TextStyle(
                              color: Renkler.Black.withOpacity(0.3),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          musteri.telNo,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Renkler.Grey),
                        ),
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
                            color: Renkler.Blue,
                          ),
                        ),
                        const Text(
                          "Ürün Bilgileri",
                          style: TextStyle(
                              color: Renkler.Grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        Text(
                          'Ürün Fiyatı: ',
                          style: TextStyle(
                              color: Renkler.Black.withOpacity(0.3),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${urun.urunFiyati}',
                          style: const TextStyle(
                              color: Renkler.Grey,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        Text(
                          'Satış Fiyatı: ',
                          style: TextStyle(
                              color: Renkler.Black.withOpacity(0.3),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${urun.urunFiyati}',
                          style: TextStyle(
                              color: Renkler.Grey,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        Text(
                          'Satış Tarihi: ',
                          style: TextStyle(
                              color: Renkler.Black.withOpacity(0.3),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "12/07/2020",
                          style: TextStyle(
                              color: Renkler.Grey,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 25),
                    child: Row(
                      children: [
                        Text(
                          "Bakım Var Mı? : ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.Black.withOpacity(0.3)),
                        ),
                        Text(
                          urun.bakimVarMi == true ? "Evet" : "Hayır",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Renkler.Grey),
                        ),
                      ],
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
