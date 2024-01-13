import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takip_plus/Components/Profil/UpdateImage.dart';

class UrunEkle extends StatefulWidget {
  UrunEkle({super.key});

  @override
  State<UrunEkle> createState() => _UrunEkleState();
}

class _UrunEkleState extends State<UrunEkle> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img;
    img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img as Uint8List?;
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
              "ÜRÜN EKLE",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ürünlerinizi görebilmek için ürün ekleyin.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      backgroundColor: Renkler.White,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Ürün Adı",
                    counterStyle: TextStyle(color: Renkler.Black),
                    hintText: "Ürün Adı",
                    prefixIcon: Icon(Icons.shopping_cart, color: Renkler.Black),
                    hintStyle: TextStyle(color: Renkler.Black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Barkod",
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "Barkod",
                          prefixIcon:
                              Icon(Icons.qr_code_2, color: Renkler.Black),
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
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.qr_code_2,
                        color: Renkler.Black,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Açıklama",
                    counterStyle: TextStyle(color: Renkler.Black),
                    hintText: "Açıklama",
                    prefixIcon: Icon(Icons.edit, color: Renkler.Black),
                    hintStyle: TextStyle(color: Renkler.Black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Miktar",
                          counterStyle: TextStyle(color: Renkler.Black),
                          hintText: "Miktar",
                          prefixIcon: Icon(Icons.edit_road_outlined,
                              color: Renkler.Black),
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 150,
                  width: 400,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      MemoryImage(_image! as Uint8List),
                                )
                              : const CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage("assets/urunler/ürün-1.png"),
                                ),
                          Center(
                            child: Positioned(
                              child: IconButton(
                                onPressed: selectImage,
                                icon: Icon(Icons.add_a_photo),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Ürünü Ekle"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Renkler.White),
                          backgroundColor:
                              MaterialStatePropertyAll(Renkler.Black)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
