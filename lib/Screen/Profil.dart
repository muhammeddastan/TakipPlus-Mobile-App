import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/Profil/AboutProfileScreen.dart';
import 'package:takip_plus/Components/Profil/ProfilMenu.dart';
import 'package:takip_plus/Components/Profil/UpdateProfileScreen.dart';
import 'package:takip_plus/Components/Profil/UygulamaHakkindaScreen.dart';
import 'package:takip_plus/Pages/GirisYap.dart';

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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Serhat Güneş Developer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Renkler.Grey),
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
                              MaterialStateProperty.all(Renkler.Blue),
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
