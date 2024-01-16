// ignore: unused_import
// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Components/Profil/UpdateImage.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Renkler.White,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Profilim",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Profil Bilgileriniz.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      backgroundColor: Renkler.White,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage:
                              AssetImage("assets/images/avatar.jpg"),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    const TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Ad Soyad",
                        counterStyle: TextStyle(color: Renkler.Black),
                        hintText: "Ad Soyad",
                        prefixIcon: Icon(Icons.supervisor_account_rounded,
                            color: Renkler.Black),
                        hintStyle: TextStyle(color: Renkler.Black),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Renkler.Green),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-posta",
                        hintText: "E-posta",
                        prefixIcon:
                            Icon(Icons.mail_outline, color: Renkler.Black),
                        hintStyle: TextStyle(color: Renkler.Black),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Telefon",
                        hintText: "Telefon",
                        prefixIcon: Icon(Icons.phone, color: Renkler.Black),
                        hintStyle: TextStyle(color: Renkler.Black),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Şifreniz",
                        hintText: "Şifreniz",
                        counterStyle: TextStyle(color: Renkler.Black),
                        prefixIcon:
                            Icon(Icons.lock_open_sharp, color: Renkler.Black),
                        hintStyle: TextStyle(color: Renkler.Black),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Renkler.Black,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          "Güncelle",
                          style: TextStyle(
                              color: Renkler.White,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
