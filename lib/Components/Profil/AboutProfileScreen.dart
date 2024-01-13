// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class AboutProfileScreen extends StatefulWidget {
  const AboutProfileScreen({super.key});

  @override
  State<AboutProfileScreen> createState() => _AboutProfileScreenState();
}

class _AboutProfileScreenState extends State<AboutProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Renkler.Green,
        foregroundColor: Renkler.White,
        title: const Text("Biz Kimiz?"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
          child: const Column(
            children: [
              Text(
                "Takip Plus Hakkında",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Takip Plus, 10 yıllık muhasebe ve iş takip deneyimiyle iş dünyasına yön veren bir uygulamadır. Müşteri takibi ve ürün yönetimi konusunda uzmanlaşan Takip Plus, işletmenizin finansal süreçlerini kolaylaştırarak iş kontrolünü parmaklarınızın ucuna getirir. Kolay kullanımı, mobil uyumu ve güvenilirliği ile Tanışın - Takip Plus, işinizi yönetmeyi bir adım öteye taşıyor.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
