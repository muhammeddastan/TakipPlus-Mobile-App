// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';
import 'package:takip_plus/Models/MusteriModel.dart';
import 'package:takip_plus/Pages/Musteri/MusteriDetayPage.dart';
import 'package:takip_plus/Pages/Musteri/MusteriEkle.dart';

class MusterilerScreen extends StatefulWidget {
  const MusterilerScreen({Key? key}) : super(key: key);

  @override
  State<MusterilerScreen> createState() => _MusterilerScreenState();
}

class _MusterilerScreenState extends State<MusterilerScreen> {
  // DatabaseHelper sınıfını kullanmak için instance oluşturduk
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  // MusteriModel listesini tutacak bir liste oluştyoruz
  List<MusteriModel> _musteriler = [];
  @override
  void initState() {
    super.initState();
    _getMusteriler(); // Uygulama başladığında verileri çekiyoruz
  }

  // Veritabanından ürünleri çekmek için bu işlevi kullanıyoruz
  void _getMusteriler() async {
    final List<Map<String, dynamic>> musterilerMapList =
        await _databaseHelper.queryAllMusteriData();

    List<MusteriModel> musteriler =
        musterilerMapList.map((map) => MusteriModel.fromMap(map)).toList();

    setState(() {
      _musteriler = musteriler; // Burada _musteriler listesini güncelliyoruz
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
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(
            IconlyLight.user3,
            size: 30,
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "MÜŞTERİLER",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Müşterilerinizi inceleyebilir, düzenleyebilir ve silebilirsiniz.",
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
                  MaterialPageRoute(
                    builder: (context) => const MusteriEkleScreen(),
                  ),
                ).then((value) => {
                      setState(
                        () {
                          _getMusteriler();
                        },
                      )
                    });
              },
              icon: const Icon(IconlyLight.addUser),
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
                  delegate: CustomSearchDelegate(musteriler: _musteriler),
                );
              },
              icon: const Icon(IconlyLight.search),
            ),
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
                itemCount: _musteriler.length,
                itemBuilder: (context, index) {
                  MusteriModel musteri = _musteriler[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Renkler.Black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Renkler.White.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                IconlyLight.profile,
                                color: Renkler.White,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                musteri.musteriAdSoyad,
                                style: const TextStyle(
                                  color: Renkler.White,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                musteri.musteriTelNo,
                                style: const TextStyle(color: Renkler.White),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Renkler.White.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50),
                            ),
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
                                        onPressed: () =>
                                            Navigator.pop(context, 'İptal'),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Renkler.Black),
                                        ),
                                        child: const Text(
                                          'İptal',
                                          style:
                                              TextStyle(color: Renkler.White),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await _databaseHelper.deleteMusteri(
                                              _musteriler[index].id);
                                          setState(() {
                                            _musteriler.removeAt(index);
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
                                          style:
                                              TextStyle(color: Renkler.White),
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
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Renkler.White.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MusteriDetayPage(
                                        musteri: musteri,
                                      ),
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
  final List<MusteriModel> musteriler;

  CustomSearchDelegate({required this.musteriler});

  @override
  String get searchFieldLabel => "Müşteri Ara";

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
    List<MusteriModel> filteredMusteriler = musteriler
        .where((musteri) =>
            musteri.musteriAdSoyad.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredMusteriler.length,
      itemBuilder: (context, index) {
        MusteriModel musteri = filteredMusteriler[index];
        return ListTile(
          title: Text(musteri.musteriAdSoyad),
          onTap: () {
            // Burada tıklanan müşteriye ait detay sayfasına git
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MusteriDetayPage(musteri: musteri),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = musteriler
        .where((musteri) =>
            musteri.musteriAdSoyad.toLowerCase().contains(query.toLowerCase()))
        .map((musteri) => musteri.musteriAdSoyad)
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
