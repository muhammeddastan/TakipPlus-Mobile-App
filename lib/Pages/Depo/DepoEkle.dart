import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/DepoModel.dart';
import 'package:takip_plus/Pages/Depo/Depolar.dart';

class DepoEkleScreen extends StatefulWidget {
  const DepoEkleScreen({super.key});
  @override
  State<DepoEkleScreen> createState() => _DepoEkleScreenState();
}

class _DepoEkleScreenState extends State<DepoEkleScreen> {
  final TextEditingController _depoAdiController = TextEditingController();
  final TextEditingController _depoTelNoController = TextEditingController();
  final TextEditingController _depoSehirController = TextEditingController();
  final TextEditingController _depoAdresController = TextEditingController();

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
              "DEPO EKLE",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Depolarınızı görebilmek için ürün ekleyin.",
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
                  controller: _depoAdiController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Depo Adı ",
                    labelStyle: TextStyle(color: Renkler.Black),
                    counterStyle: TextStyle(color: Renkler.Black),
                    hintText: "Depo Adı Zorunlu",
                    prefixIcon: Icon(IconlyBold.home, color: Renkler.Black),
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
                        controller: _depoTelNoController,
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
                  controller: _depoAdresController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Adres ",
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
                        controller: _depoSehirController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Şehir",
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "Şehir Zorunlu",
                          prefixIcon: Icon(IconlyLight.location),
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
                  String depoAdi = _depoAdiController.text.trim();
                  String depoTelNo = _depoTelNoController.text.trim();
                  String depoSehir = _depoSehirController.text.trim();
                  String depoAdres = _depoAdresController.text.trim();

                  if (depoAdi.isEmpty ||
                      depoTelNo.isEmpty ||
                      depoSehir.isEmpty ||
                      depoAdres.isEmpty) {
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
                  final yeniDepo = DepoModel(
                    depoAdi: depoAdi,
                    depoTelno: depoTelNo,
                    depoSehir: depoSehir,
                    depoAdres: depoAdres,
                  );

                  // Depolar listesini güncelle
                  setState(() {
                    DepolarScreen.depolar.add(yeniDepo);
                    print("Ürün Eklendi");
                  });

                  // Bilgileri temizle
                  _depoAdiController.clear();
                  _depoTelNoController.clear();
                  _depoSehirController.clear();
                  _depoAdresController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(
                        'Depo başarıyla eklendi',
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
