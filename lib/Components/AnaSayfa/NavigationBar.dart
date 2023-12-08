// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Screen/AnaSayfa.dart';
import 'package:takip_plus/Screen/Bakim.dart';
import 'package:takip_plus/Screen/Musteriler.dart';
import 'package:takip_plus/Screen/Profil.dart';

class NavigationBarBottom extends StatefulWidget {
  const NavigationBarBottom({Key? key}) : super(key: key);

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  int secilenIndex = 0;

  final List<Widget> ekranlar = [
    AnaSayfa(),
    BakimScreen(),
    MusterilerScreen(),
    ProfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      secilenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: ekranlar[secilenIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Renkler.Blue,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            color: Renkler.White,
            size: 38,
          ),
        ),
      ),
      backgroundColor: Renkler.White,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.1,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: secilenIndex == 0
                  ? Icon(CupertinoIcons.house)
                  : Icon(CupertinoIcons.house_fill),
              onPressed: () => _onItemTapped(0),
              color: secilenIndex == 0 ? Renkler.Blue : Colors.grey,
              iconSize: 25,
            ),
            IconButton(
              icon: secilenIndex == 1
                  ? Icon(CupertinoIcons.timer)
                  : Icon(CupertinoIcons.timer_fill),
              onPressed: () => _onItemTapped(1),
              color: secilenIndex == 1 ? Renkler.Blue : Colors.grey,
              iconSize: 25,
            ),
            SizedBox(width: 48), // Orta boşluk
            IconButton(
              icon: secilenIndex == 2
                  ? Icon(CupertinoIcons.person_3)
                  : Icon(CupertinoIcons.person_3_fill),
              onPressed: () => _onItemTapped(2),
              color: secilenIndex == 2 ? Renkler.Blue : Colors.grey,
              iconSize: 25,
            ),
            IconButton(
              icon: secilenIndex == 3
                  ? Icon(CupertinoIcons.person_alt_circle)
                  : Icon(CupertinoIcons.person_alt_circle_fill),
              onPressed: () => _onItemTapped(3),
              color: secilenIndex == 3 ? Renkler.Blue : Colors.grey,
              style: ButtonStyle(
                iconSize: MaterialStatePropertyAll(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
