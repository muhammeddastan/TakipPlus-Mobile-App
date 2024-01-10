import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/AnaSayfa/KasaVeIslemler.dart';
import 'package:takip_plus/Components/AnaSayfa/SonIslemler.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int secilenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Renkler.Green,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            KasaVeIslemler(),
            SonIslemler(),
          ],
        ),
      ),
    );
  }
}
