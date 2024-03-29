// ignore_for_file: file_names, avoid_print, use_build_context_synchronously, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/NavigationBar.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';
import 'package:takip_plus/Models/UyeModel.dart';
import 'package:takip_plus/Pages/Giris/Login-SignUp/KayitOl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static UyeModel? girisYapanKullanici;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<UyeModel> _uyeler = [];
  @override
  void initState() {
    super.initState();
    _getUyeler(); // Uygulama başladığında verileri çekiyoruz
  }

// Veritabanından ürünleri çekmek için bu işlevi kullanıyoruz
  void _getUyeler() async {
    final List<Map<String, dynamic>> uyelerMapList =
        await _databaseHelper.queryAllUyeData();

    List<UyeModel> uyeler =
        uyelerMapList.map((map) => UyeModel.fromMap(map)).toList();

    setState(() {
      _uyeler = uyeler;
    });
  }

  final TextEditingController ePostaController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                "OTURUM AÇ",
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
                        controller: ePostaController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Renkler.Black,
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
                              cursorColor: Renkler.Black,
                              controller: sifreController,
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
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        String uyeEposta = ePostaController.text.trim();
                        String uyeSifre = sifreController.text.trim();
                        print("Girilen E-Posta: $uyeEposta");
                        print("Girilen Şifre: $uyeSifre");

                        // Kullanıcı giriş işlemi
                        bool loginSuccess = await _databaseHelper.login(
                          uyeEposta,
                          uyeSifre,
                        );

                        if (loginSuccess) {
                          // Başarılı giriş
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Giriş Başarılı!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationBarBottom(),
                            ),
                            (route) => false,
                          );
                        } else {
                          // Başarısız giriş
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Hatalı E-Posta veya Şifre',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 60),
                          backgroundColor: Renkler.Black,
                          foregroundColor: Renkler.White),
                      child: const Text(
                        "OTURUM AÇ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("VEYA"),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 60),
                          backgroundColor: Renkler.GoogleRenk,
                          foregroundColor: Renkler.White),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/gmail.png",
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Google ile Giriş Yap",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Hesabınız yok mu?",
                    style: TextStyle(
                        color: Renkler.Black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KayitOl()),
                      );
                    },
                    child: const Text(
                      " Kayıt Ol ",
                      style: TextStyle(
                          color: Renkler.GoogleRenk,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
