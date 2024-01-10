import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Pages/Urunler/UrunEkle.dart';
//import 'package:flutter/src/material/divider.dart';

class StokSayfasi extends StatelessWidget {
  final List _posts = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
    'post 6',
    'post 7',
    'post 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burası Stok Sayfasıdır'),
      ),
      body: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return Urun(
              child: _posts[index],
            );
          }),
    );
  }
}

class Urun extends StatelessWidget {
  final String child;

  Urun({required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 90,
              margin: EdgeInsets.all(0),
              child: const ClipRRect(
                child: Image(
                  image: AssetImage('assets/images/kombin.jpg'),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Text(
                    'Ürün Başlığı Buraya Gelecek',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      '24.12.2023',
                      style: TextStyle(
                        fontSize: 17,
                        color: Renkler.Green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Adet : 48',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '49.99 TL',
                      style: TextStyle(
                          color: Renkler.Green,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.settings,
                        color: Renkler.Green,
                        size: 30,
                      ),
                      onTap: () {
                        print('Ürün Düzenlendi');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UrunEkle()),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.delete,
                        color: Renkler.Green,
                        size: 30,
                      ),
                      onTap: () {
                        print('Ürün Silindi');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UrunEkle()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
