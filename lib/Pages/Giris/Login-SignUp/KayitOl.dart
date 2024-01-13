import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/UyeModel.dart';
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: musteriSifreController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Şifre",
                                labelStyle: TextStyle(color: Renkler.Black),
                                counterStyle: TextStyle(color: Renkler.Black),
                                hintText: "Şifre",
                                prefixIcon: Icon(IconlyLight.password,
                                    color: Renkler.Black),
                                hintStyle: TextStyle(color: Renkler.Black),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 5, color: Renkler.Black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Renkler.Black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
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
                              controller: musteriSifreTekrarController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Şifre Tekrar",
                                labelStyle: TextStyle(color: Renkler.Black),
                                counterStyle: TextStyle(color: Renkler.Black),
                                hintText: "Şifre",
                                prefixIcon: Icon(IconlyLight.password,
                                    color: Renkler.Black),
                                hintStyle: TextStyle(color: Renkler.Black),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 5, color: Renkler.Black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Renkler.Black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Renkler.White,
                      onTap: () {
                        String adSoyad = musteriAdiController.text.trim();
                        String ePosta = musteriEPostaController.text.trim();
                        String sifre = musteriSifreController.text.trim();
                        String sifreTekrar =
                            musteriSifreTekrarController.text.trim();

                        if (adSoyad.isEmpty ||
                            ePosta.isEmpty ||
                            sifre.isEmpty ||
                            sifreTekrar.isEmpty) {
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
                        if (sifre != sifreTekrar) {
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
                        final yeniUye = UyeModel(
                          adSoyad: adSoyad,
                          ePosta: ePosta,
                          sifre: sifre,
                        );
                        // Müşteriler listesini güncelle
                        setState(() {
                          LoginPage.uyeler.add(yeniUye);
                          print("Üye Eklendi $yeniUye");
                        });

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (route) => false, // Geçmişteki tüm sayfaları kapat
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Renkler.Black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "KAYIT OL",
                            style: TextStyle(
                                color: Renkler.White,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
