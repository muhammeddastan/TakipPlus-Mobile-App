import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/Profil/AboutProfileScreen.dart';
import 'package:takip_plus/Components/Profil/ProfilMenu.dart';
import 'package:takip_plus/Components/Profil/UpdateProfileScreen.dart';
import 'package:takip_plus/Components/Profil/UygulamaHakkindaScreen.dart';
import 'package:takip_plus/Pages/GirisYap.dart';
import 'package:takip_plus/Pages/Urunler/UrunListesi.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Renkler.Green,
        title: const Text(
          "Takip Plus",
          style: TextStyle(color: Renkler.White, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 1),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              ProfileMenuWidget(
                title: 'Ürünler',
                icon: Icons.shopping_cart,
                OnPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UrunListesi()),
                  );
                },
              ),
              ProfileMenuWidget(
                title: 'Belgeler',
                icon: Icons.edit_document,
                OnPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Masraflar',
                icon: Icons.monetization_on_sharp,
                OnPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Raporlar',
                icon: Icons.analytics_outlined,
                OnPress: () {},
              ),
              Divider(
                color:
                    const Color.fromARGB(255, 110, 110, 110).withOpacity(0.4),
              ),
              ProfileMenuWidget(
                title: 'Tedarikçiler',
                icon: Icons.person_pin_outlined,
                OnPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Müşteriler',
                icon: Icons.person_2_rounded,
                OnPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Depolar',
                icon: Icons.store_mall_directory_sharp,
                OnPress: () {},
              ),
              Divider(
                color:
                    const Color.fromARGB(255, 110, 110, 110).withOpacity(0.4),
              ),
              ProfileMenuWidget(
                title: 'Ayarlar',
                icon: Icons.settings,
                OnPress: () {},
              ),

              ProfileMenuWidget(
                title: 'Yardım',
                icon: Icons.help_outline_rounded,
                OnPress: () {},
              ),

              ProfileMenuWidget(
                title: 'Gizlilik Politikası',
                icon: Icons.aod_outlined,
                OnPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const UygulamaHakkindaScreen()));
                },
              ),
              // ProfileMenuWidget(
              //   title: 'Biz Kimiz?',
              //   icon: Icons.accessibility_new_outlined,
              //   OnPress: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const AboutProfileScreen()));
              //   },
              // ),
              ProfileMenuWidget(
                title: 'Çıkış Yap',
                icon: Icons.power_settings_new,
                endIcon: false,
                OnPress: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Renkler.White,
                    title: const Text('Çıkış Yap'),
                    content: const Text("Çıkmak istediğinize emin misiniz?"),
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
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            )),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
