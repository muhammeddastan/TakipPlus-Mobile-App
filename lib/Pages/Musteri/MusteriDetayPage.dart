// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/MusteriModel.dart';

class MusteriDetayPage extends StatefulWidget {
  final MusteriModel musteri;

  const MusteriDetayPage({
    Key? key,
    required this.musteri,
  }) : super(key: key);

  @override
  State<MusteriDetayPage> createState() => _MusteriDetayPageState();
}

class _MusteriDetayPageState extends State<MusteriDetayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.White,
      appBar: AppBar(
        backgroundColor: Renkler.White,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "MÜŞTERİLER",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Müşterilerinizi inceleyin.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              maxRadius: 50,
              backgroundColor: Renkler.Black.withOpacity(0.4),
              child: const Icon(
                IconlyLight.profile,
                color: Renkler.White,
                size: 50,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Renkler.Black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Ad Soyad",
                        style: TextStyle(
                            color: Renkler.White,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        widget.musteri.adiSoyadi,
                        style: const TextStyle(
                            color: Renkler.White,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Renkler.Black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Telefon No",
                        style: TextStyle(
                            color: Renkler.White,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        widget.musteri.telNo,
                        style: const TextStyle(
                            color: Renkler.White,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Renkler.Black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Adres",
                        style: TextStyle(
                            color: Renkler.White,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        widget.musteri.adres,
                        style: const TextStyle(
                            color: Renkler.White,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Renkler.Black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Açıklama",
                        style: TextStyle(
                            color: Renkler.White,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        widget.musteri.aciklama,
                        style: const TextStyle(
                            color: Renkler.White,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
