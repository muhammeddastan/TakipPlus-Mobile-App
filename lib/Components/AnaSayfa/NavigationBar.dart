// ignore_for_file: file_names, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Screen/AnaSayfa.dart';
import 'package:takip_plus/Screen/Bakim.dart';
import 'package:takip_plus/Screen/Musteriler.dart';
import 'package:takip_plus/Screen/Profil.dart';
import 'dart:math';

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
      body: ekranlar[secilenIndex],
      backgroundColor: Renkler.White,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, left: 20, right: 20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                decoration: BoxDecoration(
                  color: secilenIndex == 0 ? Renkler.White : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    _onItemTapped(0);
                  },
                  icon: Icon(Icons.home),
                  color: secilenIndex == 0 ? Colors.blue : Renkler.Grey,
              Container(
                decoration: BoxDecoration(
                  color: secilenIndex == 1 ? Renkler.White : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    _onItemTapped(1);
                  },
                  icon: Icon(Icons.search),
                  color: secilenIndex == 1 ? Colors.blue : Renkler.Grey,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: secilenIndex == 2 ? Renkler.White : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    _onItemTapped(2);
                  },
                  icon: Icon(Icons.settings),
                  color: secilenIndex == 2 ? Colors.blue : Renkler.Grey,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: secilenIndex == 3 ? Renkler.White : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    _onItemTapped(3);
                  },
                  icon: Icon(Icons.person),
                  color: secilenIndex == 3 ? Colors.blue : Renkler.Grey,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Renkler.White,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.1,
              color: Renkler.Grey,
            ), // Opsiyonel: Üzerinde bir çizgi ekleyebilirsiniz.
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: IconButton(
                color: secilenIndex == 0 ? Renkler.Green : Renkler.Grey,
                iconSize: 25,
                icon: Icon(secilenIndex == 0
                    ? (CupertinoIcons.house_fill)
                    : (CupertinoIcons.house)),
                onPressed: () => _onItemTapped(0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, right: 50),
              child: IconButton(
                color: secilenIndex == 1 ? Renkler.Green : Renkler.Grey,
                icon: Icon(secilenIndex == 1
                    ? (CupertinoIcons.timer_fill)
                    : (CupertinoIcons.timer)),
                iconSize: 25,
                onPressed: () => _onItemTapped(1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 10, right: 20),
              child: IconButton(
                color: secilenIndex == 2 ? Renkler.Green : Renkler.Grey,
                icon: Icon(secilenIndex == 2
                    ? (CupertinoIcons.person_3_fill)
                    : (CupertinoIcons.person_3)),
                iconSize: 25,
                onPressed: () => _onItemTapped(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: IconButton(
                color: secilenIndex == 3 ? Renkler.Green : Renkler.Grey,
                icon: Icon(secilenIndex == 3
                    ? (CupertinoIcons.person_alt_circle_fill)
                    : (CupertinoIcons.person_alt_circle)),
                iconSize: 25,
                onPressed: () => _onItemTapped(3),
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),

    );
  }
}
