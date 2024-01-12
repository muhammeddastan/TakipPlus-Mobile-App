import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Models/MusteriModel.dart';
import 'package:takip_plus/Models/UrunModel.dart';
import 'package:takip_plus/Pages/MusteriDetayPage.dart';

class MusterilerScreen extends StatefulWidget {
  const MusterilerScreen({super.key});

  @override
  State<MusterilerScreen> createState() => _MusterilerScreenState();
}

class _MusterilerScreenState extends State<MusterilerScreen> {
  final List<MusteriModel> Musteriler = [
    MusteriModel(
        adiSoyadi: "Muhammed Daştan",
        adres: "ASD mah. ASDA sk. No:11 D:3",
        telNo: "05512345678",
        aciklama: "Bu bir deneme yazısıdır"),
    MusteriModel(
        adiSoyadi: "Serhat Güneş",
        adres: "BAC mah. DAFG sk. No:11 D:5",
        telNo: "01234567890",
        aciklama: "Bu bir deneme yazısıdır"),
    MusteriModel(
        adiSoyadi: "Mehmet Özbek",
        adres: "BAC mah. DAFG sk. No:11 D:5",
        telNo: "01234567890",
        aciklama: "Bu bir deneme yazısıdır"),

    // Diğer müşterileri buraya ekleyebilirsiniz.
  ];

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Renkler.White,
        centerTitle: false,
        leading: Container(
          decoration: BoxDecoration(
              color: Renkler.Black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50)),
          child: const Icon(
            IconlyLight.user3,
            size: 30,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "MÜŞTERİLER",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Müşterilerinizi inceleyebilir, düzenleyebilir ve silebilirsiniz.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Renkler.Black.withOpacity(0.1)),
            child:
                IconButton(onPressed: () {}, icon: Icon(IconlyLight.addUser)),
          ),
          SizedBox(width: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Renkler.Black.withOpacity(0.1),
            ),
            child: IconButton(onPressed: () {}, icon: Icon(IconlyLight.search)),
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Renkler.White,
      body: RefreshIndicator(
        color: Renkler.Black,
        backgroundColor: Renkler.White,
        onRefresh: _refresh,
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: Musteriler.length,
                itemBuilder: (context, index) {
                  MusteriModel musteri = Musteriler[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Renkler.Black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Renkler.White.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                IconlyLight.profile,
                                color: Renkler.White,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                musteri.adiSoyadi,
                                style: const TextStyle(
                                    color: Renkler.White,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                musteri.telNo,
                                style: const TextStyle(color: Renkler.White),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Renkler.White.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    backgroundColor: Renkler.White,
                                    content: const Text(
                                        "Silmek istediğinize emin misiniz?"),
                                    icon: const Icon(
                                      IconlyLight.delete,
                                      size: 30,
                                      color: Renkler.GoogleRenk,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'İptal'),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Renkler.Black),
                                        ),
                                        child: const Text(
                                          'İptal',
                                          style:
                                              TextStyle(color: Renkler.White),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            Musteriler.removeAt(index);
                                          });
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Renkler.Danger),
                                        ),
                                        child: const Text(
                                          'Sil',
                                          style:
                                              TextStyle(color: Renkler.White),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(
                                IconlyLight.delete,
                                color: Renkler.GoogleRenk,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Renkler.White.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MusteriDetayPage(
                                        musteri: musteri,
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  IconlyLight.show,
                                  color: Renkler.White,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
