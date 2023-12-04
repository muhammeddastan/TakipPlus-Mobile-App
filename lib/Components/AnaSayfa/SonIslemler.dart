// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class SonIslemler extends StatelessWidget {
  const SonIslemler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Renkler.White,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0,
                      left: MediaQuery.of(context).size.width * 0.03),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Son İşlemler",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0,
                      right: MediaQuery.of(context).size.width * 0.03),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Daha Fazla",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Renkler.Blue),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(
                          Icons.arrow_circle_left_outlined,
                          color: Renkler.Blue,
                          size: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //ÜRÜN ADI
                        Text(
                          "Arıtma Sistemi",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),

                        //MÜŞTERİ ADI
                        Text(
                          "Muhammed Daştan",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.013,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),

                        //TARİH-ZAMAN
                        Text(
                          "12/10/2023",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.013,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),

                    //ADET
                    const Text(
                      "x2",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Renkler.Blue),
                    ),
                    const Spacer(),

                    //FİYAT
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1299.00₺",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
