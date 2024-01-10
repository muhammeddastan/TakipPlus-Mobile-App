import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:input_quantity/input_quantity.dart';

class UrunEkle extends StatelessWidget {
  const UrunEkle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Renkler.Green,
        title: const Text(
          "Ürün Ekle",
          style: TextStyle(color: Renkler.White, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
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
                    counterStyle: TextStyle(color: Renkler.Green),
                    hintText: "Ürün Adı",
                    prefixIcon: Icon(Icons.shopping_cart, color: Renkler.Green),
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
                          counterStyle: TextStyle(color: Renkler.Green),
                          hintText: "Barkod",
                          prefixIcon:
                              Icon(Icons.qr_code_2, color: Renkler.Green),
                          hintStyle: TextStyle(color: Renkler.Grey),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5, color: Renkler.Grey),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Renkler.Green),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.qr_code_2,
                        color: Renkler.Green,
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
                    counterStyle: TextStyle(color: Renkler.Green),
                    hintText: "Açıklama",
                    prefixIcon: Icon(Icons.edit, color: Renkler.Green),
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
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Miktar",
                          counterStyle: TextStyle(color: Renkler.Green),
                          hintText: "Miktar",
                          prefixIcon: Icon(Icons.edit_road_outlined,
                              color: Renkler.Green),
                          hintStyle: TextStyle(color: Renkler.Grey),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5, color: Renkler.Grey),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Renkler.Green),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_road_outlined,
                        color: Renkler.Green,
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
