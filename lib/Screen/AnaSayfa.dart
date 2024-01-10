import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/AnaSayfa/KasaVeIslemler.dart';
import 'package:takip_plus/Components/AnaSayfa/SonIslemler.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int secilenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.White,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Renkler.Black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Renkler.White,
                      foregroundImage: AssetImage("assets/images/avatar.jpg"),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hoşgeldiniz",
                            style: TextStyle(
                                color: Renkler.White,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "Muhammed Daştan",
                            style: TextStyle(
                                color: Renkler.White,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.bell,
                        size: 30,
                        color: Renkler.White,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "ÖZET",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Renkler.White),
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
                                Icons.account_balance_wallet,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.only(left: 20.0),
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
                              icon: Icon(
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Renkler.Black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Text(
                              "3600₺",
                              style: GoogleFonts.josefinSans(
                                  fontSize: 25, color: Renkler.White),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Renkler.White.withOpacity(0.2)),
                              child: const Icon(
                                Icons.attach_money_sharp,
                                color: Renkler.White,
                              ),
                            ),
                          )
                        ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                icon: Icon(
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
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Renkler.Black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Text(
                              "1200₺",
                              style: GoogleFonts.josefinSans(
                                  fontSize: 25, color: Renkler.White),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Renkler.White.withOpacity(0.2)),
                              child: const Icon(
                                Icons.attach_money_sharp,
                                color: Renkler.White,
                              ),
                            ),
                          )
                        ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                icon: Icon(
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
              ],
            ),

            //KasaVeIslemler(),
            // SonIslemler(),
          ],
        ),
      ),
    );
  }
}
