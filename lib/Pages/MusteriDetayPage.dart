// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/MusteriModel.dart';
import 'package:takip_plus/Models/UrunModel.dart'; // MusteriModel import edildiğinden emin olmalısınız

class MusteriDetayPage extends StatefulWidget {
  final MusteriModel musteri;

  MusteriDetayPage({
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
        title: Column(
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
            SizedBox(height: 20),
            CircleAvatar(
              maxRadius: 50,
              backgroundColor: Renkler.Black.withOpacity(0.4),
              child: Icon(
                IconlyLight.profile,
                color: Renkler.White,
                size: 50,
              ),
            ),
            SizedBox(height: 20),
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
                      Text(
                        "Ad Soyad",
                        style: TextStyle(
                            color: Renkler.White,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        widget.musteri.adiSoyadi,
                        style: TextStyle(
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
                      Text(
                        "Telefon No",
                        style: TextStyle(
                            color: Renkler.White,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        widget.musteri.telNo,
                        style: TextStyle(
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
                      Text(
                        "Adres",
                        style: TextStyle(
                            color: Renkler.White,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        widget.musteri.adres,
                        style: TextStyle(
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
                      Text(
                        "Açıklama",
                        style: TextStyle(
                            color: Renkler.White,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      Text(
                        widget.musteri.aciklama,
                        style: TextStyle(
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
