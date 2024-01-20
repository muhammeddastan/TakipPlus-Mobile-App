// ignore_for_file: file_names

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';
import 'package:takip_plus/Pages/AnaSayfa/Gelirler/Gelirler.dart';
import 'package:takip_plus/Pages/AnaSayfa/Giderler/Giderler.dart';
import 'package:takip_plus/Pages/Giris/Login-SignUp/GirisYap.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  String gelirAdi = "";
  int gelirPara = 0;
  String giderAdi = "";
  int giderPara = 0;

  int secilenIndex = 0;
  Future<void> init() async {
    final lastGelirData = await _databaseHelper.getLastGelirData();
    final lastGiderData = await _databaseHelper.getLastGiderData();

    if (lastGelirData.isNotEmpty) {
      gelirAdi = lastGelirData[0]["gelirAdi"];
      gelirPara = int.parse(lastGelirData[0]["gelirPara"].toString());
    }

    if (lastGiderData.isNotEmpty) {
      giderAdi = lastGiderData[0]["giderAdi"];
      giderPara = int.parse(lastGiderData[0]["giderPara"].toString());
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Renkler.White,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            backgroundColor: Renkler.Black.withOpacity(0.2),
            child: const Center(
              child: Icon(
                IconlyLight.profile,
                color: Renkler.Black,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Hoşgeldiniz",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
            Text(
              LoginPage.girisYapanKullanici?.uyeAdSoyad ?? "",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Renkler.Black.withOpacity(0.1),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyLight.notification,
                    size: 30,
                  )),
            ),
          )
        ],
      ),
      backgroundColor: Renkler.White,
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: RefreshIndicator(
            onRefresh: _refresh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "ÖZET",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Renkler.Black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.BlueDark,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Gelir - Gider = ",
                              style: TextStyle(
                                  color: Renkler.White,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${gelirPara - giderPara}",
                                style: GoogleFonts.josefinSans(
                                    fontSize: 40, color: Renkler.White),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Renkler.White.withOpacity(0.1)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    IconlyLight.wallet,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Elinizde Kalan Para",
                                style: GoogleFonts.raleway(
                                    color: Renkler.White, fontSize: 30),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //GELİR CONTAINER
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Renkler.Black,
                        foregroundColor: Renkler.White,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.48, 200),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GelirlerScreen(),
                          ),
                        ).then((value) {
                          init();
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$gelirPara₺",
                                style: GoogleFonts.josefinSans(
                                    fontSize: 25, color: Renkler.White),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Renkler.White.withOpacity(0.2)),
                                child: const Icon(
                                  Iconsax.money_recive,
                                  size: 25,
                                  color: Renkler.White,
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              gelirAdi,
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 17),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Gelirler",
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    color: Renkler.White,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const GelirlerScreen(),
                                    ),
                                  ).then((value) {
                                    init();
                                  });
                                },
                                icon: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Renkler.White.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Icon(
                                    CarbonIcons.touch_1,
                                    size: 25,
                                    color: Renkler.White,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    //GİDER CONTAINER
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: Renkler.Black,
                        foregroundColor: Renkler.White,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.48, 200),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GiderlerScreen(),
                          ),
                        ).then((value) {
                          init();
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$giderPara ₺",
                                style: GoogleFonts.josefinSans(
                                    fontSize: 25, color: Renkler.White),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Renkler.White.withOpacity(0.2)),
                                child: const Icon(
                                  Iconsax.money_send,
                                  size: 25,
                                  color: Renkler.White,
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              giderAdi,
                              style: const TextStyle(
                                  color: Renkler.Danger, fontSize: 17),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Giderler",
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    color: Renkler.White,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const GiderlerScreen(),
                                    ),
                                  ).then((value) {
                                    init();
                                  });
                                },
                                icon: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Renkler.White.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Icon(
                                    CarbonIcons.touch_1,
                                    size: 25,
                                    color: Renkler.White,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
