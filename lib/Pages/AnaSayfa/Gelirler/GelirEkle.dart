import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';

class GelirEkleScreen extends StatefulWidget {
  const GelirEkleScreen({Key? key}) : super(key: key);

  @override
  State<GelirEkleScreen> createState() => _GelirEkleScreenState();
}

class _GelirEkleScreenState extends State<GelirEkleScreen> {
  final TextEditingController gelirAdiController = TextEditingController();
  final TextEditingController gelirTipController = TextEditingController();
  final TextEditingController gelirParaController = TextEditingController();
  final TextEditingController gelirTarihController = TextEditingController();
  DateTime? tarihSec;

  final DateFormat tarihFormat = DateFormat('dd.MM.yy HH:mm:ss');

  String selectedGelirTip = "";
  final List<String> gelirTipleri = [
    'Gelir Tipi Seçiniz',
    'BİREYSEL ÖDEME',
    'BORÇ',
    'TAKSİT',
    'KİRA',
    'DİĞER',
  ]; // Ödeme tipleri listesi

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<void> tarihFunc(BuildContext context) async {
    final DateTime? picked = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200.0,
          child: CupertinoDatePicker(
            maximumYear: 2050,
            minimumYear: 2023,
            use24hFormat: true,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                tarihSec = newDate;
                gelirTarihController.text = tarihFormat.format(tarihSec!);
              });
            },
            mode: CupertinoDatePickerMode.date,
          ),
        );
      },
    );

    if (picked != null) {
      setState(() {
        tarihSec = picked;
        gelirTarihController.text = tarihFormat.format(tarihSec!);
      });
    }
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
              "GELİR EKLE",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Gelirlerinizi görebilmek için ekleyin.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      backgroundColor: Renkler.White,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                cursorColor: Renkler.Black,
                controller: gelirAdiController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Gelir Adı ",
                  labelStyle: TextStyle(color: Renkler.Black),
                  counterStyle: TextStyle(color: Renkler.Black),
                  hintText: "Gelir Adı (Zorunlu)",
                  prefixIcon: Icon(IconlyLight.profile, color: Renkler.Black),
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
              child: DropdownButtonFormField<String>(
                dropdownColor: Renkler.White,
                value: gelirTipleri.first,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGelirTip = newValue!;
                  });
                },
                items: gelirTipleri.map((String gelirTip) {
                  return DropdownMenuItem<String>(
                    value: gelirTip,
                    child: Text(gelirTip),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: "Gelir Tipi",
                  labelStyle: TextStyle(color: Renkler.Black),
                  counterStyle: TextStyle(color: Renkler.Black),
                  hintText:
                      "Ödeme Tipi Seçiniz", // Burada hint özelliğini kullanabilirsiniz
                  prefixIcon: Icon(IconlyLight.category),
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
                controller: gelirParaController,
                decoration: const InputDecoration(
                  labelText: "Para",
                  labelStyle: TextStyle(color: Renkler.Black),
                  counterStyle: TextStyle(color: Renkler.Black),
                  hintText: "Para (Zorunlu)",
                  prefixIcon: Icon(Iconsax.money),
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      cursorColor: Renkler.Black,
                      controller: gelirTarihController,
                      onTap: () {
                        tarihFunc(context);
                      },
                      decoration: const InputDecoration(
                        labelText: "Tarih",
                        labelStyle: TextStyle(color: Renkler.Black),
                        counterStyle: TextStyle(color: Renkler.Black),
                        hintText: "Tarih (Zorunlu)",
                        prefixIcon: Icon(IconlyLight.calendar),
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
                ),
                ElevatedButton(
                  onPressed: () {
                    tarihSec = DateTime.now();
                    gelirTarihController.text = tarihFormat.format(tarihSec!);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 65),
                    backgroundColor: Renkler.White,
                    foregroundColor: Renkler.Black,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Bugün",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10)
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 60),
                backgroundColor: Renkler.Black,
                foregroundColor: Renkler.White,
              ),
              onPressed: () async {
                String gelirAdi = gelirAdiController.text.trim();
                String gelirTip = selectedGelirTip.trim();
                String gelirPara = gelirParaController.text.trim();
                String gelirTarih = gelirTarihController.text.trim();

                if (gelirAdi.isEmpty ||
                    gelirTip.isEmpty ||
                    gelirPara.isEmpty ||
                    gelirTarih.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text(
                        'Lütfen tüm alanları doldurun',
                        style: TextStyle(
                          color: Renkler.White,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: Renkler.GoogleRenk,
                    ),
                  );
                  return; // Bilgiler eksik olduğunda işlemi sonlandır
                } else if (gelirTip == gelirTipleri.first) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Lütfen Bir Gelir Tipi Seçiniz",
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
                  return; //Gelir Tipi Seçilmezse İşlem Sonlanır
                }

                await _databaseHelper.insertGelir(
                  gelirAdi,
                  gelirTip,
                  gelirPara,
                  gelirTarih,
                );

                // Bilgileri temizle
                gelirAdiController.clear();
                gelirParaController.clear();
                gelirTarihController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      'GELİR EKLENDİ',
                      style: TextStyle(
                        color: Renkler.White,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Renkler.Black, // İstediğiniz renk
                  ),
                );
              },
              child: const Text(
                "GELİR EKLE",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
