// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

Future<void> _refresh() {
  return Future.delayed(const Duration(seconds: 2));
}

class _AnaSayfaState extends State<AnaSayfa> {
  int secilenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Renkler.White,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            backgroundColor: Renkler.Black,
            foregroundImage: AssetImage("assets/images/avatar.jpg"),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hoşgeldiniz",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            Text(
              "Muhammed Daştan",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
      body: SingleChildScrollView(
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "25,785.87 ₺",
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
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Tüm Zamanlar",
                            style: TextStyle(
                                color: Renkler.White,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Tümünü Gör",
                              style: GoogleFonts.raleway(
                                  color: Renkler.White, fontSize: 30),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right_alt,
                                  size: 40,
                                  color: Renkler.White,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Renkler.Black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "3600₺",
                                style: GoogleFonts.josefinSans(
                                    fontSize: 25, color: Renkler.White),
                              ),
                              Container(
                                height: 40,
                                width: 40,
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
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 10),
                          child: Text(
                            "Serhat Güneş",
                            style: TextStyle(color: Colors.green, fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Tahsilatlar",
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    color: Renkler.White,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_right_alt,
                                    size: 30,
                                    color: Renkler.White,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Renkler.Black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1200₺",
                                style: GoogleFonts.josefinSans(
                                    fontSize: 25, color: Renkler.White),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Renkler.White.withOpacity(0.2)),
                                child: const Icon(
                                  Iconsax.money_send,
                                  size: 25,
                                  color: Renkler.White,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 10),
                          child: Text(
                            "Mehmet Özbek",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Ödemeler",
                                style: GoogleFonts.raleway(
                                    fontSize: 20,
                                    color: Renkler.White,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right_alt,
                                  size: 30,
                                  color: Renkler.White,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}
