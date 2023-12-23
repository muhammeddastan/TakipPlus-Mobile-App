import 'package:flutter/material.dart';
import 'package:takip_plus/Pages/Urunler/UrunEkle.dart';
import 'package:flutter/src/material/divider.dart';

class StokSayfasi extends StatelessWidget {
  final List _posts = [
    'post 1',
    'post 2',
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 150,
            margin: EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10), ),
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
                  'Burası Ürün Başlığı',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
              const Row(
                children: [
                  Text(
                    'Beden : ',
                    style: TextStyle(fontSize: 17, color: Colors.black),
                  ),
                  Text(
                    '46-6 Drop',
                    style: TextStyle(fontSize: 17, color: Colors.black45),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    '4500.00 TL',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () {
                      print('Sepete Eklendi.');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        child: Text(
                          'Sepete Ekle',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 17,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
