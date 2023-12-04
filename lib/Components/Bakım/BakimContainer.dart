// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class BakimContainer extends StatelessWidget {
  const BakimContainer({
    super.key,
    required this.gun,
    required this.saat,
  });

  final int gun;
  final int saat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Kalan Zaman",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '$gun Gün $saat Saat',
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Renkler.Blue),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Text(
                    "Ad Soyad: ",
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 20),
                  child: Text(
                    "Muhammed Daştan",
                    style: GoogleFonts.poppins(
                        color: Renkler.Blue, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 20,
                  ),
                  child: Text(
                    "Ürün: ",
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 20,
                  ),
                  child: Text(
                    "XYZ Arıtma Sistemi",
                    style: GoogleFonts.poppins(
                        color: Renkler.Blue, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 20,
                  ),
                  child: Text(
                    "Adres: ",
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 20,
                  ),
                  child: Text(
                    "Tk plus Mah. Tk Sk. No: 10 D:3",
                    style: GoogleFonts.poppins(
                        color: Renkler.Blue, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    top: 20,
                  ),
                  child: Text(
                    "Telefon: ",
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 20,
                  ),
                  child: Text(
                    "0555 123 4567",
                    style: GoogleFonts.poppins(
                        color: Renkler.Blue, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
