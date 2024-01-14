// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/MusteriModel.dart';
import 'package:takip_plus/Screen/Musteriler.dart';

class MusteriEkleScreen extends StatefulWidget {
  const MusteriEkleScreen({super.key});

  @override
  State<MusteriEkleScreen> createState() => _MusteriEkleScreenState();
}

class _MusteriEkleScreenState extends State<MusteriEkleScreen> {
  final TextEditingController _musteriAdiController = TextEditingController();
  final TextEditingController _musteriTelNoController = TextEditingController();
  final TextEditingController _musteriEpostaController =
      TextEditingController();
  final TextEditingController _musteriAdresController = TextEditingController();
  final TextEditingController _musteriAciklamaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Renkler.White,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "MÜŞTERİ EKLE",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Müşterilerinizi görebilmek için müşteri ekleyin.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      backgroundColor: Renkler.White,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _musteriAdiController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Ad Soyad",
                    labelStyle: TextStyle(color: Renkler.Black),
                    counterStyle: TextStyle(color: Renkler.Black),
                    hintText: "Ad Soyad Zorunlu",
                    prefixIcon: Icon(IconlyBold.profile, color: Renkler.Black),
                    hintStyle: TextStyle(color: Renkler.Black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _musteriTelNoController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "Telefon No",
                          labelStyle: TextStyle(color: Renkler.Black),
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "Telefon No Zorunlu",
                          prefixIcon: Icon(IconlyBold.call),
                          hintStyle: TextStyle(color: Renkler.Black),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5, color: Renkler.Black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Renkler.Black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _musteriAdresController,
                  decoration: const InputDecoration(
                    labelText: "Adres",
                    labelStyle: TextStyle(color: Renkler.Black),
                    counterStyle: TextStyle(color: Renkler.Black),
                    hintText: "Adres Zorunlu",
                    prefixIcon: Icon(IconlyBold.location),
                    hintStyle: TextStyle(color: Renkler.Black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _musteriEpostaController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "E-posta",
                          labelStyle: TextStyle(color: Renkler.Black),
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "E-posta Zorunlu Değil",
                          prefixIcon: Icon(IconlyBold.message),
                          hintStyle: TextStyle(color: Renkler.Black),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5, color: Renkler.Black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Renkler.Black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _musteriAciklamaController,
                        decoration: const InputDecoration(
                          labelText: "Açıklama",
                          labelStyle: TextStyle(color: Renkler.Black),
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "Açıklama Zorunlu Değil",
                          prefixIcon: Icon(IconlyBold.star),
                          hintStyle: TextStyle(color: Renkler.Black),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5, color: Renkler.Black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Renkler.Black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Renkler.Black),
                    foregroundColor: MaterialStatePropertyAll(Renkler.White)),
                onPressed: () {
                  String adiSoyadi = _musteriAdiController.text.trim();
                  String adres = _musteriTelNoController.text.trim();
                  String telNo = _musteriAdresController.text.trim();
                  String mail = _musteriAdresController.text.trim();
                  String aciklama = _musteriAciklamaController.text.trim();

                  if (adiSoyadi.isEmpty || telNo.isEmpty || adres.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          'Lütfen tüm alanları doldurun',
                          style: TextStyle(
                            color: Renkler.White,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Renkler.GoogleRenk,
                      ),
                    );
                    return; // Bilgiler eksik olduğunda işlemi sonlandır
                  }
                  final yeniMusteri = MusteriModel(
                      adiSoyadi: adiSoyadi,
                      adres: adres,
                      telNo: telNo,
                      mail: mail,
                      aciklama: aciklama);

                  // Müşteriler listesini güncelle
                  setState(() {
                    MusterilerScreen.musteriler.add(yeniMusteri);
                    print("Müşteri Eklendi");
                  });

                  // Bilgileri temizle
                  _musteriAdiController.clear();
                  _musteriTelNoController.clear();
                  _musteriAciklamaController.clear();
                  _musteriAdresController.clear();
                  _musteriEpostaController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(
                        'Müşteri başarıyla eklendi',
                        style: TextStyle(
                            color: Renkler.White,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Renkler.Black, // İstediğiniz renk
                    ),
                  );
                },
                child: const Text("KAYDET"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
