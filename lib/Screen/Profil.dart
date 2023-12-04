import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:takip_plus/Colors/Renkler.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.White,
      appBar: AppBar(
        backgroundColor: Renkler.Blue,
        foregroundColor: Renkler.White,
        title: const Text("Kullanıcı Bilgilerim"),
      ),
    );
  }
}
