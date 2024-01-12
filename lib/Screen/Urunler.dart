// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/UrunModel.dart';

class UrunListe extends StatefulWidget {
  const UrunListe({super.key});

  @override
  State<UrunListe> createState() => _UrunListeState();
}

final List<UrunModel> Urunler = [
  UrunModel(
      urunAdi: "ATA YAYINCILIK",
      urunBarkod: 123456789,
      urunAdet: 200,
      urunAciklama: "Tüm dersler test kitabı konu anlatımlı"),
  UrunModel(
      urunAdi: "Türkmen Yayıncılık",
      urunBarkod: 123456789,
      urunAdet: 50,
      urunAciklama: "Matematik 1200 Soru Test Kitabı"),
  UrunModel(
      urunAdi: "Türkmen Yayıncılık",
      urunBarkod: 123456789,
      urunAdet: 50,
      urunAciklama: "Matematik 1200 Soru Test Kitabı"),
];

Future<void> _refresh() async {
  // Bir Future.delayed ile gecikme simülasyonu
  await Future.delayed(Duration(seconds: 2));

  // Geleceği başarıyla tamamladığından emin olun
  return Future.value();
}

class _UrunListeState extends State<UrunListe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Renkler.White,
        centerTitle: false,
        leading: Container(
          decoration: BoxDecoration(
              color: Renkler.Black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50)),
          child: const Icon(
            IconlyBold.buy,
            size: 30,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "ÜRÜNLER",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ürünlerinizi inceleyebilir, düzenleyebilir ve silebilirsiniz.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Renkler.Black.withOpacity(0.1)),
            child:
                IconButton(onPressed: () {}, icon: Icon(IconlyLight.filter2)),
          ),
          SizedBox(width: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Renkler.Black.withOpacity(0.1),
            ),
            child: IconButton(onPressed: () {}, icon: Icon(IconlyLight.search)),
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Renkler.White,
      body: RefreshIndicator(
        color: Renkler.Black,
        backgroundColor: Renkler.White,
        onRefresh: _refresh,
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: Urunler.length,
                itemBuilder: (context, index) {
                  UrunModel urun = Urunler[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Renkler.Black.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20, left: 15, right: 15),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Renkler.White.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/avatar.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ürün Adı: ${urun.urunAdi}",
                                      style: const TextStyle(
                                          color: Renkler.White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Stok: ${urun.urunAdet}",
                                      style: const TextStyle(
                                          color: Renkler.White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Açıklama: ${urun.urunAciklama}",
                                      style: const TextStyle(
                                          color: Renkler.White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Barkod: ${urun.urunBarkod}",
                                      style: const TextStyle(
                                          color: Renkler.White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Renkler.White.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         UrunDetaySayfasi(urun: urun),
                                      //   ),
                                      // );
                                    },
                                    icon: Icon(
                                      IconlyLight.show,
                                      color: Renkler.White,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Renkler.White.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      IconlyLight.edit,
                                      color: Renkler.DarkBlue,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Renkler.White.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          backgroundColor: Renkler.White,
                                          content: const Text(
                                              "Silmek istediğinize emin misiniz?"),
                                          icon: Icon(
                                            IconlyLight.delete,
                                            size: 30,
                                            color: Renkler.GoogleRenk,
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'İptal'),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Renkler.Black),
                                              ),
                                              child: const Text(
                                                'İptal',
                                                style: TextStyle(
                                                    color: Renkler.White),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  Urunler.removeAt(index);
                                                });
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Renkler.Danger),
                                              ),
                                              child: const Text(
                                                'Sil',
                                                style: TextStyle(
                                                    color: Renkler.White),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      IconlyLight.delete,
                                      color: Renkler.GoogleRenk,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
