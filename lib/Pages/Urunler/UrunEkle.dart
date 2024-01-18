// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';

class UrunEkle extends StatefulWidget {
  const UrunEkle({super.key});

  @override
  State<UrunEkle> createState() => _UrunEkleState();
}

class _UrunEkleState extends State<UrunEkle> {
  final TextEditingController _urunAdiController = TextEditingController();
  final TextEditingController _barkodNoController = TextEditingController();
  final TextEditingController _aciklamaController = TextEditingController();
  final TextEditingController _urunAdetController = TextEditingController();
  String _barkodNoTara = '';
  Uint8List? _image;

  // DatabaseHelper sınıfını kullanmak için instance oluşturduk
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
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
              "ÜRÜN EKLE",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ürünlerinizi görebilmek için ürün ekleyin.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      backgroundColor: Renkler.White,
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  cursorColor: Renkler.Black,
                  controller: _urunAdiController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Ürün Adı",
                    labelStyle: TextStyle(color: Renkler.Black),
                    hintText: "Ürün Adı",
                    prefixIcon: Icon(Icons.shopping_cart, color: Renkler.Black),
                    hintStyle: TextStyle(color: Renkler.Black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: Renkler.Black,
                        controller: _barkodNoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Barkod",
                          labelStyle: TextStyle(color: Renkler.Black),
                          hintText: "Barkod",
                          prefixIcon:
                              Icon(IconlyBold.scan, color: Renkler.Black),
                          hintStyle: TextStyle(color: Renkler.Black),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5, color: Renkler.Black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Renkler.Black),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        scanBarcodeNormal();
                      },
                      icon: const Icon(
                        IconlyBold.scan,
                        color: Renkler.Black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  cursorColor: Renkler.Black,
                  controller: _urunAdetController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Miktar",
                    labelStyle: TextStyle(color: Renkler.Black),
                    hintText: "Miktar",
                    prefixIcon:
                        Icon(Icons.edit_road_outlined, color: Renkler.Black),
                    hintStyle: TextStyle(color: Renkler.Black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  cursorColor: Renkler.Black,
                  controller: _aciklamaController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Açıklama",
                    labelStyle: TextStyle(color: Renkler.Black),
                    hintText: "Açıklama",
                    prefixIcon: Icon(Icons.edit, color: Renkler.Black),
                    hintStyle: TextStyle(color: Renkler.Black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Renkler.Black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  const Text(
                    "Ürün Görsel Seç",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  _image != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/urunler/ürün-1.png"),
                        ),
                  Center(
                    child: Positioned(
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  onPressed: () async {
                    String urunAdi = _urunAdiController.text.trim();
                    String barkodNo = _barkodNoController.text.trim();
                    String urunAciklama = _aciklamaController.text.trim();
                    String urunAdet = _urunAdetController.text.trim();
                    Uint8List urunFoto = _image ?? Uint8List.fromList([]);

                    if (urunAdi.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Ürün Adı Boş Bırakılamaz',
                            style: TextStyle(
                              color: Renkler.White,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Renkler.GoogleRenk,
                        ),
                      );
                      return;
                    } else if (barkodNo.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Ürün Barkod Boş Bırakılamaz',
                            style: TextStyle(
                              color: Renkler.White,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Renkler.GoogleRenk,
                        ),
                      );
                      return;
                    } else if (urunAdet.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Ürün Miktar Boş Bırakılamaz',
                            style: TextStyle(
                              color: Renkler.White,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Renkler.GoogleRenk,
                        ),
                      );
                      return;
                    } else if (urunAciklama.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Ürün Açıklama Boş Bırakılamaz',
                            style: TextStyle(
                              color: Renkler.White,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Renkler.GoogleRenk,
                        ),
                      );
                      return;
                    } else if (urunFoto.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Ürün Fotografı Boş Bırakılamaz',
                            style: TextStyle(
                              color: Renkler.White,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Renkler.GoogleRenk,
                        ),
                      );
                      return;
                    }

                    // Veritabanına ekleme işlemi
                    await _databaseHelper.insertUrun(
                      urunAdi,
                      barkodNo,
                      int.parse(urunAdet),
                      urunAciklama,
                      urunFoto,
                    );

                    // Bilgileri temizle
                    _urunAdiController.clear();
                    _barkodNoController.clear();
                    _aciklamaController.clear();
                    _urunAdetController.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          'Ürün başarıyla eklendi',
                          style: TextStyle(
                              color: Renkler.White,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Renkler.Black, // İstediğiniz renk
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      backgroundColor: Renkler.Black,
                      foregroundColor: Renkler.White),
                  child: const Text(
                    "Ürün Ekle",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void scanBarcodeNormal() async {
    String barkodTarama;
    try {
      barkodTarama = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'İptal',
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      barkodTarama = "Platform sürümü alınamadı";
    }
    setState(() {
      _barkodNoTara = barkodTarama;
      _barkodNoController.text = _barkodNoTara;
    });
  }
}

pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
  print("Resim seçilmedi.");
}
