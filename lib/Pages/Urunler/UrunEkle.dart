import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class UrunEkle extends StatelessWidget {
  const UrunEkle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burası Ürün Ekle Sayfası'),
      ),
      body: Column(
        // asdasdasd
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: Text("Ürün Adı"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Ürün Adeti"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Ürün Fiyatı"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                label: Text("Ürün Tarih"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
            ),
          ),
          ElevatedButton(

            style: ButtonStyle(

              backgroundColor: MaterialStatePropertyAll(Renkler.Blue),
            ),
            onPressed: () {},
            child: Text(

              'ÜRÜN EKLE',
              style: TextStyle(color: Renkler.White,fontSize: 17, ),
            ),
          ),
        ],
      ),
    );
  }
}
