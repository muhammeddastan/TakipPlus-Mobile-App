import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';
import 'package:takip_plus/Models/GiderModel.dart';
import 'package:takip_plus/Pages/AnaSayfa/Giderler/GiderEkle.dart';

class GiderlerScreen extends StatefulWidget {
  const GiderlerScreen({super.key});

  @override
  State<GiderlerScreen> createState() => _GiderlerScreenState();
}

class _GiderlerScreenState extends State<GiderlerScreen> {
  // DatabaseHelper sınıfını kullanmak için instance oluşturduk
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<GiderModel> _giderler = [];

  @override
  void initState() {
    super.initState();
    _getGiderler(); // Uygulama başladığında verileri çekiyoruz
  }

  // Veritabanından ürünleri çekmek için bu işlevi kullanıyoruz
  void _getGiderler() async {
    final List<Map<String, dynamic>> giderlerMapList =
        await _databaseHelper.queryAllGiderData();

    List<GiderModel> giderler =
        giderlerMapList.map((map) => GiderModel.fromMap(map)).toList();

    // Giderleri gelirTarih'e göre sırala (en yeni tarih en üstte, en eski tarih en altta)
    giderler.sort((a, b) => b.giderTarih.compareTo(a.giderTarih));

    setState(() {
      _giderler = giderler;
      print("gider: ${_giderler.length}");
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
              "GİDERLER",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Giderleri silmek için sağdan sola kaydırın",
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
                      builder: (context) => const GiderEkleScreen(),
                    ),
                  ).then((value) => {
                        setState(() {
                          _getGiderler();
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
      body: RefreshIndicator(
        onRefresh: _refresh,
        backgroundColor: Renkler.White,
        color: Renkler.Black,
        child: ListView.builder(
          itemCount: _giderler.length,
          itemBuilder: (context, index) {
            GiderModel gider = _giderler[index];
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(gider.id.toString()),
              onDismissed: (direction) async {
                await _databaseHelper.deleteGider(gider.id);
                setState(() {
                  _databaseHelper.deleteGider(_giderler[index].id);
                  setState(() {
                    _giderler.removeAt(index);
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
                          gider.giderTarih,
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
                              child: const Icon(Iconsax.money_send),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  gider.giderAdi,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  gider.giderTip,
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
                                  "${gider.giderPara} ₺",
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
