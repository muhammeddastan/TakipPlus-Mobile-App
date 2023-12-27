// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/AnaSayfa/NavigationBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Renkler.Blue, Renkler.DarkBlue],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0,
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hoşgeldiniz",
                      style: TextStyle(color: Renkler.White, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lütfen bilgileriniz ile giriş yapınız",
                      style: TextStyle(color: Renkler.White, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1.65,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: Renkler.White,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Renkler.White,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 156, 216, 244),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "E-Posta adresi ",
                                hintText: "E-Posta adresi",
                                counterStyle: TextStyle(color: Renkler.Blue),
                                prefixIcon: Icon(Icons.mail_outline_outlined,
                                    color: Renkler.Grey),
                                hintStyle: TextStyle(color: Renkler.Grey),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 5, color: Renkler.Grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Renkler.Blue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Şifreniz",
                                hintText: "Şifreniz",
                                counterStyle: TextStyle(color: Renkler.Blue),
                                prefixIcon: Icon(Icons.lock_open_sharp,
                                    color: Renkler.Grey),
                                hintStyle: TextStyle(color: Renkler.Grey),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 5, color: Renkler.Grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: Renkler.Blue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        "Parolanızı mı unuttunuz?",
                        style: TextStyle(
                          color: Renkler.Blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, bottom: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NavigationBarBottom(),
                              ),
                            );
                          },
                          child: const Center(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationBarBottom(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Renkler.DarkBlue),
                          child: const Center(
                            child: Text(
                              "Oturum Aç",
                              style: TextStyle(
                                color: Renkler.White,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                          child: Text("VEYA",
                              style: TextStyle(color: Renkler.Grey))),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationBarBottom(),
                            ),
                          );
                        },
                        child: Center(
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Renkler.GoogleRenk),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/gmail.png",
                                    height: 20),
                                const SizedBox(width: 10),
                                Text(
                                  "Google ile giriş",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Renkler.White),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NavigationBarBottom(),
                            ),
                          );
                        },
                        child: Center(
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Renkler.FacebookRenk),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icons/facebook.png",
                                    height: 20),
                                const SizedBox(width: 10),
                                Text(
                                  "Facebook ile giriş",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Renkler.White),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 90),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              isDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.8,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Text("KAYIT OL",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Renkler.Blue)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Container(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: Renkler.White,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 156, 216, 244),
                                                  blurRadius: 20,
                                                  offset: Offset(0, 10),
                                                ),
                                              ],
                                            ),
                                            child: const Column(
                                              children: [
                                                TextField(
                                                  keyboardType:
                                                      TextInputType.name,
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    labelText: "Ad Soyad",
                                                    hintText: "Ad Soyad",
                                                    counterStyle: TextStyle(
                                                        color: Renkler.Blue),
                                                    prefixIcon: Icon(
                                                        Icons
                                                            .account_circle_outlined,
                                                        color: Renkler.Grey),
                                                    hintStyle: TextStyle(
                                                        color: Renkler.Grey),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 5,
                                                          color: Renkler.Grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Renkler.Blue),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    labelText: "E-posta",
                                                    hintText: "E-posta",
                                                    counterStyle: TextStyle(
                                                        color: Renkler.Blue),
                                                    prefixIcon: Icon(
                                                        Icons
                                                            .attach_email_outlined,
                                                        color: Renkler.Grey),
                                                    hintStyle: TextStyle(
                                                        color: Renkler.Grey),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 5,
                                                          color: Renkler.Grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Renkler.Blue),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    labelText: "Telefon",
                                                    hintText: "Telefon",
                                                    counterStyle: TextStyle(
                                                        color: Renkler.Blue),
                                                    prefixIcon: Icon(
                                                        Icons.phone,
                                                        color: Renkler.Grey),
                                                    hintStyle: TextStyle(
                                                        color: Renkler.Grey),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 5,
                                                          color: Renkler.Grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Renkler.Blue),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    labelText: "Şifre Oluştur",
                                                    hintText: "Şifre Oluştur",
                                                    counterStyle: TextStyle(
                                                        color: Renkler.Blue),
                                                    prefixIcon: Icon(
                                                        Icons.lock_open_sharp,
                                                        color: Renkler.Grey),
                                                    hintStyle: TextStyle(
                                                        color: Renkler.Grey),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 5,
                                                          color: Renkler.Grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2,
                                                          color: Renkler.Blue),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        InkWell(
                                          onTap: () {
                                            KayitEkle();
                                          },
                                          child: Container(
                                            height: 50,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 50),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Renkler.DarkBlue),
                                            child: const Center(
                                              child: Text(
                                                "Kayıt Ol",
                                                style: TextStyle(
                                                  color: Renkler.White,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Text("VEYA",
                                            style:
                                                TextStyle(color: Renkler.Grey)),
                                        const SizedBox(height: 20),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavigationBarBottom(),
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Container(
                                              height: 50,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 50),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Renkler.GoogleRenk),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/gmail.png",
                                                      height: 20),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "Google ile kayıt ol",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Renkler.White),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const NavigationBarBottom(),
                                              ),
                                            );
                                          },
                                          child: Center(
                                            child: Container(
                                              height: 50,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 50),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Renkler.FacebookRenk),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/facebook.png",
                                                      height: 20),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "Facebook ile kayıt ol",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Renkler.White),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Row(
                            children: [
                              Text(
                                "İlk kez mi buradasınız?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Bir Hesap Oluştur",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Renkler.Blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Kayit Ekleme İşlemleri
void KayitEkle() {
}
