import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Renkler.Blue,
        title: const Text(
          'Profilim',
          style: TextStyle(fontWeight: FontWeight.w600, color: Renkler.White),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(30),
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
            const SizedBox(height: 50),
            const Form(
                child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      label: Text("Adınız"),
                      prefixIcon: Icon(Icons.supervisor_account_rounded),
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 5))),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
