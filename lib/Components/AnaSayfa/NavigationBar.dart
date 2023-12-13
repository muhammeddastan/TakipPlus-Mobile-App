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
  late AnimationController animationController;
  late Animation<double> addButtonTranslationAnimation,
      cameraButtonTranslationAnimation,
      profileButtonTranslationAnimation,
      rotationAnimation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    addButtonTranslationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);
    cameraButtonTranslationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);
    profileButtonTranslationAnimation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(animationController);
    rotationAnimation = Tween<double>(
      begin: 180.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

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
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: ekranlar[secilenIndex],
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
      floatingActionButton: SizedBox(
        height: 300,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CircularTransformButton(
                color: Renkler.Blue,
                width: 60,
                height: 60,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                rotationAnimation: rotationAnimation,
                onClick: () {
                  if (animationController.isCompleted) {
                    animationController.reverse();
                  } else {
                    animationController.forward();
                  }
                },
              ),
              CircularTransformButton(
                color: Colors.red,
                width: 60,
                height: 60,
                icon: const Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                ),
                rotationAnimation: rotationAnimation,
                onClick: () {
                  print('Ürün Ekle');
                },
                direction: 320,
                translationAnimation: addButtonTranslationAnimation,
              ),
              CircularTransformButton(
                color: Colors.green,
                width: 60,
                height: 60,
                icon: const Icon(
                  CupertinoIcons.bag_badge_plus,
                  color: Colors.white,
                ),
                rotationAnimation: rotationAnimation,
                onClick: () {
                  print('Camera button');
                },
                direction: 270,
                translationAnimation: cameraButtonTranslationAnimation,
              ),
              CircularTransformButton(
                color: Colors.amber,
                width: 60,
                height: 60,
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                rotationAnimation: rotationAnimation,
                onClick: () {
                  print('Profile button');
                },
                direction: 220,
                translationAnimation: profileButtonTranslationAnimation,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Renkler.White,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 95,
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
                color: secilenIndex == 0 ? Renkler.Blue : Renkler.Grey,
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
                color: secilenIndex == 1 ? Renkler.Blue : Renkler.Grey,
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
                color: secilenIndex == 2 ? Renkler.Blue : Renkler.Grey,
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
                color: secilenIndex == 3 ? Renkler.Blue : Renkler.Grey,
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

class CircularTransformButton extends StatelessWidget {
  const CircularTransformButton({
    required this.color,
    required this.width,
    required this.height,
    required this.icon,
    required this.rotationAnimation,
    required this.onClick,
    this.direction,
    this.translationAnimation,
    Key? key,
  }) : super(key: key);

  final Color color;
  final double width;
  final double height;
  final Icon icon;
  final Animation<double> rotationAnimation;
  final VoidCallback onClick;

  final double? direction;
  final Animation<double>? translationAnimation;

  double getRadiansFromDegree(double degree) {
    return degree * (pi / 180); // Radyan hesabı için pi sayısını kullanın.
  }

  @override
  Widget build(BuildContext context) {
    return direction != null && translationAnimation != null
        ? AnimatedBuilder(
            animation:
                Listenable.merge([rotationAnimation, translationAnimation!]),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset.fromDirection(
                  getRadiansFromDegree(direction!),
                  translationAnimation!.value * 100.0,
                ),
                child: Transform(
                  transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value),
                      ) *
                      Matrix4.diagonal3Values(
                        translationAnimation!.value,
                        translationAnimation!.value,
                        1.0,
                      ),
                  alignment: Alignment.center,
                  child: Container(
                    decoration:
                        BoxDecoration(color: color, shape: BoxShape.circle),
                    width: width,
                    height: height,
                    child: IconButton(
                      icon: icon,
                      enableFeedback: true,
                      onPressed: onClick,
                    ),
                  ),
                ),
              );
            },
          )
        : Transform(
            transform: Matrix4.rotationZ(
                getRadiansFromDegree(rotationAnimation.value)),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              width: width,
              height: height,
              child: IconButton(
                icon: icon,
                enableFeedback: true,
                onPressed: onClick,
              ),
            ),
          );
  }
}
