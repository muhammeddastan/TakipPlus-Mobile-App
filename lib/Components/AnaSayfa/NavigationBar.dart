// ignore_for_file: file_names, prefer_const_constructors

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

  void _aktifIcon(int index) {
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
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: secilenIndex == 0 ? Renkler.White : Renkler.Black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    _aktifIcon(0);
                  },
                  icon: Icon(Icons.home),
                  color: secilenIndex == 0 ? Renkler.Black : Renkler.White,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: secilenIndex == 1 ? Renkler.White : Renkler.Black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    _aktifIcon(1);
                  },
                  icon: Icon(Icons.shopping_basket_rounded),
                  color: secilenIndex == 1 ? Renkler.Black : Renkler.White,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: secilenIndex == 2 ? Renkler.White : Renkler.Black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    _aktifIcon(2);
                  },
                  icon: Icon(Icons.settings),
                  color: secilenIndex == 2 ? Renkler.Black : Renkler.White,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: secilenIndex == 3 ? Renkler.White : Renkler.Black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  onPressed: () {
                    _aktifIcon(3);
                  },
                  icon: Icon(Icons.person),
                  color: secilenIndex == 3 ? Renkler.Black : Renkler.White,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
