import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Pages/widgets/ProfilMenu.dart';
import 'package:takip_plus/Pages/widgets/UpdateProfileScreen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    // gece modu
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      // backgroundColor: isDark ? Renkler.Black : Renkler.White,
      appBar: AppBar(
        // backgroundColor: isDark ? Renkler.Black : Renkler.Blue,
        centerTitle: true,
        backgroundColor: Renkler.Blue,
        title: const Text(
          "Profil Bilgilerim",
          style: TextStyle(color: Renkler.White, fontWeight: FontWeight.bold),
          // style: TextStyle(color: isDark ? Renkler.White : Renkler.White),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(isDark ? Icons.dark_mode_outlined : Icons.dark_mode)),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/images/avatar.jpg'))),
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
                  "demo@gamail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Renkler.Grey),
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
                        backgroundColor:
                            MaterialStateProperty.all(Renkler.Blue)),
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
                    color: const Color.fromARGB(255, 110, 110, 110)
                        .withOpacity(0.4)),
                const SizedBox(
                  height: 10,
                ),
                // MENU
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
                  OnPress: () {},
                ),

                ProfileMenuWidget(
                  title: 'Biz kimiz?',
                  icon: Icons.accessibility_new_outlined,
                  OnPress: () {},
                ),
                Divider(
                    color: const Color.fromARGB(255, 110, 110, 110)
                        .withOpacity(0.4)),
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
      ),
    );
  }
}
