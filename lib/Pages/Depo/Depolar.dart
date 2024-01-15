// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';
import 'package:takip_plus/Models/DepoModel.dart';
import 'package:takip_plus/Pages/Depo/DepoDetay.dart';
import 'package:takip_plus/Pages/Depo/DepoEkle.dart';

class DepolarScreen extends StatefulWidget {
  const DepolarScreen({super.key});

  @override
  State<DepolarScreen> createState() => _DepolarScreenState();
}

class _DepolarScreenState extends State<DepolarScreen> {
  // DatabaseHelper sınıfını kullanmak için instance oluşturduk
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  List<DepoModel> _depolar = [];

  @override
  void initState() {
    super.initState();
    _getDepolar(); // Uygulama başladığında verileri çekiyoruz
  }

  // Veritabanından ürünleri çekmek için bu işlevi kullanıyoruz
  void _getDepolar() async {
    final List<Map<String, dynamic>> depolarMapList =
        await _databaseHelper.queryAllDepoData();

    List<DepoModel> depolar =
        depolarMapList.map((map) => DepoModel.fromMap(map)).toList();

    setState(() {
      _depolar = depolar; // Burada _depolar listesini güncelliyoruz
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
              "DEPOLAR",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Depolarınızı inceleyebilir, düzenleyebilir ve silebilirsiniz.",
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
                color: Renkler.Black.withOpacity(0.1)),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DepoEkleScreen(),
                    ),
                  ).then(
                    (value) => {
                      setState(() {
                        _getDepolar();
                      }),
                    },
                  );
                },
                icon: const Icon(IconlyLight.plus)),
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
                    delegate: CustomSearchDelegate(depolar: _depolar),
                  );
                },
                icon: const Icon(IconlyLight.search)),
          ),
          const SizedBox(width: 10),
        ],
      ),
      backgroundColor: Renkler.White,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _depolar.length,
                itemBuilder: ((context, index) {
                  DepoModel depo = _depolar[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Renkler.Black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 20, bottom: 15, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Renkler.White.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Depo Adı: ${depo.depoAdi}",
                                    style: const TextStyle(
                                        color: Renkler.White,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Renkler.White.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Telefon: ${depo.depoTelNo}",
                                    style: const TextStyle(
                                        color: Renkler.White,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Renkler.White.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Adres: ${depo.depoAdres}",
                                    style: const TextStyle(
                                        color: Renkler.White,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Renkler.White.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Şehir: ${depo.depoSehir}",
                                    style: const TextStyle(
                                        color: Renkler.White,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Renkler.White.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DepoDetayPage(depo: depo),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      IconlyLight.show,
                                      color: Renkler.White,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  height: 50,
                                  width: 50,
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
                                                    .deleteDepo(
                                                        _depolar[index].id);
                                                setState(() {
                                                  _depolar.removeAt(index);
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
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<DepoModel> depolar;

  CustomSearchDelegate({required this.depolar});

  @override
  String get searchFieldLabel => "Depo Ara";

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
    List<DepoModel> filteredDepolar = depolar
        .where(
            (depo) => depo.depoAdi.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredDepolar.length,
      itemBuilder: (context, index) {
        DepoModel depo = filteredDepolar[index];
        return ListTile(
          title: Text(depo.depoAdi),
          onTap: () {
            // Burada tıklanan müşteriye ait detay sayfasına git
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DepoDetayPage(depo: depo),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = depolar
        .where(
            (depo) => depo.depoAdi.toLowerCase().contains(query.toLowerCase()))
        .map((depo) => depo.depoAdi)
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
