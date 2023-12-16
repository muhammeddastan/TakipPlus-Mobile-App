import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/Profil/AboutProfileScreen.dart';
import 'package:takip_plus/Components/Profil/ProfilMenu.dart';
import 'package:takip_plus/Components/Profil/UpdateProfileScreen.dart';
import 'package:takip_plus/Components/Profil/UygulamaHakkindaScreen.dart';

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
        backgroundColor: Renkler.Blue,
        title: const Text(
          "Profil Bilgilerim",
          style: TextStyle(color: Renkler.White, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/images/avatar.jpg')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Renkler.Blue),
                      child: const Icon(
                        Icons.create_sharp,
                        color: Renkler.White,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Serhat Güneş",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Renkler.Grey),
              ),
              const Text(
                "demo@gmail.com",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Renkler.Grey),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Renkler.Blue),
                  ),
                  child: const Text(
                    "Profil Düzenle",
                    style: TextStyle(color: Renkler.White),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Divider(
                color:
                    const Color.fromARGB(255, 110, 110, 110).withOpacity(0.4),
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: 'Grafikler',
                icon: Icons.graphic_eq,
                OnPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Ayarlar',
                icon: Icons.settings,
                OnPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Uygulama Hakkında',
                icon: Icons.aod_outlined,
                OnPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const UygulamaHakkindaScreen()));
                },
              ),
              ProfileMenuWidget(
                title: 'Biz Kimiz?',
                icon: Icons.accessibility_new_outlined,
                OnPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutProfileScreen()));
                },
              ),
              Divider(
                color:
                    const Color.fromARGB(255, 110, 110, 110).withOpacity(0.4),
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: 'Çıkış Yap',
                icon: Icons.power_settings_new,
                endIcon: false,
                OnPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
