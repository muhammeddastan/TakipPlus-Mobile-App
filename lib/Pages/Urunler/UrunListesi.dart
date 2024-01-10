import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Pages/Urunler/UrunEkle.dart';

class UrunListesi extends StatefulWidget {
  const UrunListesi({super.key});

  @override
  State<UrunListesi> createState() => _UrunListesiState();
}

class _UrunListesiState extends State<UrunListesi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Renkler.Green,
        title: const Text(
          "Ürün Listesi",
          style: TextStyle(color: Renkler.White, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Renkler.White,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 300),
          child: Center(
            child: Column(children: [
              Icon(
                size: 100,
                Icons.shopping_cart,
                color: Renkler.Green,
              ),
              Text(
                "Ürünlerinizi Ekleyiniz",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Renkler.Green,
        child: const Icon(Icons.shopping_cart, color: Renkler.White),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UrunEkle()));
        },
      ),
    );
  }
}
