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
                ),
              ),
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
    );
  }
}
