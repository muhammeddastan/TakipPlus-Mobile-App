import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Screen/AnaSayfa.dart';
import 'package:takip_plus/Screen/Urunler.dart';
import 'package:takip_plus/Screen/Musteriler.dart';
import 'package:takip_plus/Screen/Hizmetler.dart';
import 'dart:math';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

class NavigationBarBottom extends StatefulWidget {
  const NavigationBarBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom>
    with SingleTickerProviderStateMixin {
  int secilenIndex = 0;

  final List<Widget> ekranlar = [
    AnaSayfa(),
    UrunListe(),
    MusterilerScreen(),
    HizmetScreen(),
  ];

  void _aktifIcon(int index) {
    setState(() {
      secilenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ekranlar[secilenIndex],
      bottomNavigationBar: CrystalNavigationBar(
        enableFloatingNavBar: true,
        currentIndex: secilenIndex,

        //Gezinme çubuğu altındaki çizgi rengi
        // indicatorColor: Colors.white,

        unselectedItemColor: Colors.white70,
        backgroundColor: Renkler.Black,
        // outlineBorderColor: Colors.black.withOpacity(0.1),
        onTap: _aktifIcon,
        items: [
          /// Home
          CrystalNavigationBarItem(
            icon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            selectedColor: Renkler.White,
          ),

          /// Favourite
          CrystalNavigationBarItem(
            icon: IconlyBold.buy,
            unselectedIcon: IconlyLight.buy,
            selectedColor: Renkler.GoogleRenk,
          ),

          /// Search
          CrystalNavigationBarItem(
              icon: IconlyBold.user3,
              unselectedIcon: IconlyLight.user3,
              selectedColor: Renkler.DarkBlue),

          /// Profile
          CrystalNavigationBarItem(
            icon: IconlyBold.category,
            unselectedIcon: IconlyLight.category,
            selectedColor: Renkler.Green,
          ),
        ],
      ),
    );
  }
}
