// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/Profil/UygulamaHakkindaScreen.dart';
import 'package:takip_plus/Pages/Depo/Depolar.dart';
import 'package:takip_plus/Pages/Giris/Login-SignUp/GirisYap.dart';
import 'package:takip_plus/Pages/Urunler/UrunEkle.dart';

class HizmetScreen extends StatefulWidget {
  const HizmetScreen({Key? key}) : super(key: key);

  @override
  State<HizmetScreen> createState() => _HizmetScreenState();
}

class _HizmetScreenState extends State<HizmetScreen> {
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
            IconlyLight.category,
            size: 30,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "HİZMETLER",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "İşlerinizi daha verimli hale getirin.",
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
            child: IconButton(
                onPressed: () {}, icon: const Icon(IconlyLight.profile)),
          ),
          const SizedBox(width: 10),
        ],
      ),
      backgroundColor: Renkler.White,
      //BODY:
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 1),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UrunEkle()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.Black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.buy,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Ürün Ekle",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.Black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Iconsax.money_send,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Giderler",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.Black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.graph,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Raporlar",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color:
                    const Color.fromARGB(255, 110, 110, 110).withOpacity(0.4),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.Black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.addUser,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Tedarikçiler",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DepolarScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.Black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.home,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Depolar",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color:
                    const Color.fromARGB(255, 110, 110, 110).withOpacity(0.4),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.Grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.setting,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Ayarlar",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.FacebookRenk,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.dangerTriangle,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Yardım",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UygulamaHakkindaScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.Green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.shieldFail,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Gizlilik Politikası",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UygulamaHakkindaScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.DarkBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.user2,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Biz Kimiz?",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    //SAYFA YÖNLENDİRME ALANI
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: Renkler.White,
                        title: const Text('Çıkış Yap'),
                        content:
                            const Text("Çıkmak istediğinize emin misiniz?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'İptal'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Renkler.Green),
                            ),
                            child: const Text(
                              'İptal',
                              style: TextStyle(color: Renkler.White),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) =>
                                    false, // Geçmişteki tüm sayfaları kapat
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Renkler.Danger),
                            ),
                            child: const Text(
                              'Çıkış Yap',
                              style: TextStyle(color: Renkler.White),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Renkler.GoogleRenk,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            IconlyLight.closeSquare,
                            color: Renkler.White,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Çıkış Yap",
                            style: TextStyle(color: Renkler.White),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            IconlyLight.arrowRight,
                            color: Renkler.White,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              )
            ],
          ),
        ),
      ),
    );
  }
}
