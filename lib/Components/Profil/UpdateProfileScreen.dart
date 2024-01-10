// ignore: unused_import
import 'dart:ffi';
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
        centerTitle: true,
        backgroundColor: Renkler.Green,
        foregroundColor: Renkler.White,
        title: const Text(
          'Profilim',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    bottom: -10,
                    left: 80,
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
                        counterStyle: TextStyle(color: Renkler.Green),
                        hintText: "Ad Soyad",
                        prefixIcon: Icon(Icons.supervisor_account_rounded,
                            color: Renkler.Grey),
                        hintStyle: TextStyle(color: Renkler.Grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Renkler.Grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Renkler.Green),
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
                            Icon(Icons.mail_outline, color: Renkler.Grey),
                        hintStyle: TextStyle(color: Renkler.Grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Renkler.Grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Renkler.Green),
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
                        prefixIcon: Icon(Icons.phone, color: Renkler.Grey),
                        hintStyle: TextStyle(color: Renkler.Grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Renkler.Grey),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Renkler.Green),
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
                        counterStyle: TextStyle(color: Renkler.Green),
                        prefixIcon:
                            Icon(Icons.lock_open_sharp, color: Renkler.Grey),
                        hintStyle: TextStyle(color: Renkler.Grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Renkler.Grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Renkler.Green),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Renkler.Green,
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
