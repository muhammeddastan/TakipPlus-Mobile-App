// ignore_for_file: file_names, use_build_context_synchronously
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';
import 'package:takip_plus/Models/UrunModel.dart';
import 'package:takip_plus/Pages/Urunler/UrunDetay.dart';
import 'package:takip_plus/Pages/Urunler/UrunEkle.dart';

class UrunListe extends StatefulWidget {
  const UrunListe({super.key});

  @override
  State<UrunListe> createState() => _UrunListeState();
}

class _UrunListeState extends State<UrunListe> {
// DatabaseHelper sınıfını kullanmak için instance oluşturduk
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  // UrunModel listesini tutacak bir liste oluşturuyoruz
  List<UrunModel> _urunler = [];

  @override
  void initState() {
    super.initState();
    _getUrunler(); // Uygulama başladığında verileri çekiyoruz
  }

  // Veritabanından ürünleri çekmek için bu işlevi kullanıyoruz
  void _getUrunler() async {
    final List<Map<String, dynamic>> urunlerMapList =
        await _databaseHelper.queryAllUrunData();

    List<UrunModel> urunler =
        urunlerMapList.map((map) => UrunModel.fromMap(map)).toList();

    setState(() {
      _urunler = urunler;
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
        leading: Container(
          decoration: BoxDecoration(
              color: Renkler.Black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50)),
          child: const Icon(
            IconlyLight.buy,
            size: 30,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "ÜRÜNLER",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ürünlerinizi inceleyebilir, silebilirsiniz.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Renkler.Black.withOpacity(0.1),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UrunEkle()),
                ).then((value) => {
                      setState(
                        () {
                          _getUrunler();
                        },
                      )
                    });
              },
              icon: const Icon(IconlyLight.plus),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Renkler.Black.withOpacity(0.1),
            ),
            child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(urunler: _urunler),
                  );
                },
                icon: const Icon(IconlyLight.search)),
          ),
          const SizedBox(width: 10),
        ],
      ),
      backgroundColor: Renkler.White,
      body: RefreshIndicator(
        color: Renkler.Black,
        backgroundColor: Renkler.White,
        onRefresh: _refresh,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _urunler.length,
                itemBuilder: (context, index) {
                  UrunModel urun = _urunler[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Renkler.Black.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20, left: 15, right: 15),
                                child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Renkler.White.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: _urunler[index].urunFoto != null
                                        ? Image.memory(
                                            _urunler[index].urunFoto!,
                                            fit: BoxFit.cover,
                                          )
                                        : const Icon(
                                            IconlyLight.image,
                                            size: 50,
                                            color: Renkler.White,
                                          )),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ürün Adı: ${urun.urunAdi}",
                                      style: const TextStyle(
                                          color: Renkler.White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Stok: ${urun.urunAdet}",
                                      style: const TextStyle(
                                          color: Renkler.White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Açıklama: ${urun.urunAciklama}",
                                      style: const TextStyle(
                                          color: Renkler.White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Barkod: ${urun.barkodNo}",
                                      style: const TextStyle(
                                          color: Renkler.White,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Renkler.White.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UrunDetayScreen(urun: urun),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      IconlyLight.show,
                                      color: Renkler.White,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Renkler.White.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          backgroundColor: Renkler.White,
                                          content: const Text(
                                              "Silmek istediğinize emin misiniz?"),
                                          icon: const Icon(
                                            IconlyLight.delete,
                                            size: 30,
                                            color: Renkler.GoogleRenk,
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'İptal'),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Renkler.Black),
                                              ),
                                              child: const Text(
                                                'İptal',
                                                style: TextStyle(
                                                    color: Renkler.White),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await _databaseHelper
                                                    .deleteUrun(
                                                        _urunler[index].id);
                                                setState(() {
                                                  _urunler.removeAt(index);
                                                });

                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Renkler.Danger),
                                              ),
                                              child: const Text(
                                                'Sil',
                                                style: TextStyle(
                                                    color: Renkler.White),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      IconlyLight.delete,
                                      color: Renkler.GoogleRenk,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<UrunModel> urunler;

  CustomSearchDelegate({required this.urunler});

  @override
  String get searchFieldLabel => "Ürün Adı veya Barkod No Girin";

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios),
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget buildResults(BuildContext context) {
    List<UrunModel> filteredUrunler = urunler.where(
      (urun) {
        String lowerCaseQuery = query.toLowerCase();
        return urun.urunAdi.toLowerCase().contains(lowerCaseQuery) ||
            urun.barkodNo.toString().contains(lowerCaseQuery);
      },
    ).toList();

    return ListView.builder(
      itemCount: filteredUrunler.length,
      itemBuilder: (context, index) {
        UrunModel urun = filteredUrunler[index];
        return ListTile(
          title: Text(urun.barkodNo.toString()),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UrunDetayScreen(urun: urun),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<UrunModel> suggestions = urunler.where(
      (urun) {
        String lowerCaseQuery = query.toLowerCase();
        return urun.urunAdi.toLowerCase().contains(lowerCaseQuery) ||
            urun.barkodNo.toString().contains(lowerCaseQuery);
      },
    ).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final UrunModel suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion.urunAdi),
          onTap: () {
            query = suggestion.urunAdi;
            showResults(context);
          },
        );
      },
    );
  }
}
