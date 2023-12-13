// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/Bak%C4%B1m/BakimContainer.dart';

class BakimScreen extends StatefulWidget {
  const BakimScreen({super.key});

  @override
  State<BakimScreen> createState() => _BakimScreenState();
}

class _BakimScreenState extends State<BakimScreen> {
  final DateTime _hedefTarih = DateTime(2024, 6, 7, 1, 0, 0); // Hedef tarih
  late Duration _kalanSure;
  late Timer _sayac;

  @override
  void initState() {
    super.initState();
    zamanHesapla();
  }

  void zamanHesapla() {
    DateTime currentDate = DateTime.now();
    _kalanSure = _hedefTarih.difference(currentDate);

    // Her saniye yeniden hesaplama
    _sayac = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_kalanSure.inSeconds > 0) {
          _kalanSure = _kalanSure - const Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    // Timer'ı dispose etme
    _sayac.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int gun = _kalanSure.inDays;
    int saat = _kalanSure.inHours % 24;
    int dakika = _kalanSure.inMinutes % 60;
    int saniye = _kalanSure.inSeconds % 60;

    return Scaffold(
      backgroundColor: Renkler.White,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.42,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Renkler.Blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  SafeArea(
                    child: Text(
                      "Bakım Zamanı !",
                      style: GoogleFonts.ubuntu(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Renkler.White),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                      "SERHAT GÜNEŞ",
                      style: TextStyle(
                          color: Renkler.White, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "TK Plus Mah. Tk Sk. No: 11 D: 3 Umraniye/İSTANBUL",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "$gun Gün $saat Saat $dakika Dakika $saniye Saniye",
                      style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Renkler.White.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.phone,
                              color: Renkler.White,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Renkler.White.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.message_outlined,
                              color: Renkler.White,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "İletişime Geç",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ],
              ),
            ),
            BakimContainer(gun: gun, saat: saat),
          ],
        ),
      ),
    );
  }
}
