// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';
import 'package:takip_plus/Pages/Giris/Login-SignUp/GirisYap.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({super.key});

  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController musteriAdiController = TextEditingController();
    final TextEditingController musteriEPostaController =
        TextEditingController();
    final TextEditingController musteriSifreController =
        TextEditingController();
    final TextEditingController musteriSifreTekrarController =
        TextEditingController();

    // DatabaseHelper sınıfını kullanmak için instance oluşturduk
    final DatabaseHelper databaseHelper = DatabaseHelper.instance;

    return Scaffold(
      backgroundColor: Renkler.White,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HOŞGELDİNİZ",
                style: GoogleFonts.mukta(
                    color: Renkler.Black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "KAYIT OL",
                style: TextStyle(
                    color: Renkler.Black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              Form(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        cursorColor: Renkler.Black,
                        controller: musteriAdiController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "Ad Soyad",
                          labelStyle: TextStyle(color: Renkler.Black),
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "Ad Soyad",
                          prefixIcon:
                              Icon(IconlyLight.profile, color: Renkler.Black),
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
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        cursorColor: Renkler.Black,
                        controller: musteriEPostaController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "E-Posta",
                          labelStyle: TextStyle(color: Renkler.Black),
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "E-Posta",
                          prefixIcon:
                              Icon(IconlyLight.message, color: Renkler.Black),
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
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        cursorColor: Renkler.Black,
                        controller: musteriSifreController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Şifre",
                          labelStyle: TextStyle(color: Renkler.Black),
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "Şifre",
                          prefixIcon:
                              Icon(IconlyLight.password, color: Renkler.Black),
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
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        cursorColor: Renkler.Black,
                        controller: musteriSifreTekrarController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Şifre Tekrar",
                          labelStyle: TextStyle(color: Renkler.Black),
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "Şifre",
                          prefixIcon:
                              Icon(IconlyLight.password, color: Renkler.Black),
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
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 60),
                          backgroundColor: Renkler.Black,
                          foregroundColor: Renkler.White),
                      onPressed: () async {
                        String uyeAdSoyad = musteriAdiController.text.trim();
                        String uyeEposta = musteriEPostaController.text.trim();
                        String uyeSifre = musteriSifreController.text.trim();
                        String uyeSifreTekrar =
                            musteriSifreTekrarController.text.trim();

                        if (uyeAdSoyad.isEmpty ||
                            uyeEposta.isEmpty ||
                            uyeSifre.isEmpty ||
                            uyeSifreTekrar.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
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
                          return;
                        }
                        if (uyeSifre != uyeSifreTekrar) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Şifreler uyuşmuyor',
                                style: TextStyle(
                                  color: Renkler.White,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor:
                                  Renkler.GoogleRenk, // İstediğiniz renk
                            ),
                          );
                          return;
                        }

                        bool ePostaKontrol =
                            await databaseHelper.ePostaDogrulama(uyeEposta);
                        if (ePostaKontrol) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Bu e-posta adresi zaten kayıtlı!',
                                style: TextStyle(
                                  color: Renkler.White,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: Renkler.GoogleRenk,
                            ),
                          );
                          return;
                        }

                        //VERİ TABANINA EKLEME İŞLEMİ
                        await databaseHelper.insertUye(
                          uyeAdSoyad,
                          uyeEposta,
                          uyeSifre,
                        );

                        musteriAdiController.clear();
                        musteriEPostaController.clear();
                        musteriSifreController.clear();
                        musteriSifreTekrarController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text(
                              'Kayıt Başarılı',
                              style: TextStyle(
                                  color: Renkler.White,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Renkler.Green, // İstediğiniz renk
                          ),
                        );

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false, // Geçmişteki tüm sayfaları kapat
                        );
                      },
                      child: const Text(
                        "KAYIT OL",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                icon: const Icon(
                  IconlyLight.closeSquare,
                  size: 30,
                  color: Renkler.GoogleRenk,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
