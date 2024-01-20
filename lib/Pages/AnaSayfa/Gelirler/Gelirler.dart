import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';
import 'package:takip_plus/Models/GelirModel.dart';
import 'package:takip_plus/Pages/AnaSayfa/Gelirler/GelirEkle.dart';

class GelirlerScreen extends StatefulWidget {
  const GelirlerScreen({super.key});

  @override
  State<GelirlerScreen> createState() => _GelirlerScreenState();
}

class _GelirlerScreenState extends State<GelirlerScreen> {
  // DatabaseHelper sınıfını kullanmak için instance oluşturduk
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  static List<GelirModel> _gelirler = [];

  @override
  void initState() {
    super.initState();
    _getGelirler(); // Uygulama başladığında verileri çekiyoruz
  }

  // Veritabanından ürünleri çekmek için bu işlevi kullanıyoruz
  void _getGelirler() async {
    final List<Map<String, dynamic>> gelirlerMapList =
        await _databaseHelper.queryAllGelirData();

    List<GelirModel> gelirler =
        gelirlerMapList.map((map) => GelirModel.fromMap(map)).toList();

    // Gelirleri gelirTarih'e göre sırala (en yeni tarih en üstte, en eski tarih en altta)
    gelirler.sort((a, b) => b.gelirTarih.compareTo(a.gelirTarih));

    setState(() {
      _gelirler = gelirler;
      print("gelir: ${_gelirler.length}");
    });
  }

  Future<void> _refresh() async {
    setState(() {});
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
              "GELİRLER",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Gelirleri silmek için sağdan sola kaydırın",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Renkler.Black.withOpacity(0.1),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GelirEkleScreen(),
                    ),
                  ).then((value) => {
                        setState(() {
                          _getGelirler();
                        })
                      });
                },
                icon: const Icon(
                  IconlyLight.plus,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Renkler.White,
      body: RefreshIndicator(
        onRefresh: _refresh,
        backgroundColor: Renkler.White,
        color: Renkler.Black,
        child: ListView.builder(
          itemCount: _gelirler.length,
          itemBuilder: (context, index) {
            GelirModel gelir = _gelirler[index];
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(gelir.id.toString()),
              onDismissed: (direction) async {
                await _databaseHelper.deleteGelir(gelir.id);
                setState(() {
                  _databaseHelper.deleteGelir(_gelirler[index].id);
                  setState(() {
                    _gelirler.removeAt(index);
                  });
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "GELİR SİLİNDİ",
                      style: TextStyle(
                        color: Renkler.White,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    duration: Duration(seconds: 1),
                    backgroundColor: Renkler.Danger,
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(
                  IconlyLight.delete,
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          gelir.gelirTarih,
                          style: const TextStyle(
                              color: Renkler.Black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Renkler.Black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Renkler.Black.withOpacity(0.1),
                              ),
                              child: const Icon(Iconsax.money_recive),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  gelir.gelirAdi,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  gelir.gelirTip,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${gelir.gelirPara} ₺",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Renkler.Green),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
