import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Database/DataBaseHelper.dart';

class GiderEkleScreen extends StatefulWidget {
  const GiderEkleScreen({super.key});

  @override
  State<GiderEkleScreen> createState() => _GiderEkleScreenState();
}

class _GiderEkleScreenState extends State<GiderEkleScreen> {
  final TextEditingController giderAdiController = TextEditingController();
  final TextEditingController giderTipController = TextEditingController();
  final TextEditingController giderParaController = TextEditingController();
  final TextEditingController giderTarihController = TextEditingController();
  DateTime? tarihSec;

  final DateFormat tarihFormat = DateFormat('dd.MM.yy HH:mm:ss');
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
                giderTarihController.text = tarihFormat.format(tarihSec!);
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
        giderTarihController.text = tarihFormat.format(tarihSec!);
      });
    }
  }

  String selectedGiderTip = "";
  final List<String> giderTipleri = [
    'Gider Tipi Seçiniz',
    'BİREYSEL ÖDEME',
    'BORÇ',
    'TAKSİT',
    'KİRA',
    'DİĞER',
  ]; // Ödeme tipleri listesi

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
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
              "GİDER EKLE",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Giderlerinizi görebilmek için ekleyin.",
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
                controller: giderAdiController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Gider Adı ",
                  labelStyle: TextStyle(color: Renkler.Black),
                  counterStyle: TextStyle(color: Renkler.Black),
                  hintText: "Gider Adı (Zorunlu)",
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
                value: giderTipleri.first,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGiderTip = newValue!;
                  });
                },
                items: giderTipleri.map((String giderTip) {
                  return DropdownMenuItem<String>(
                    value: giderTip,
                    child: Text(giderTip),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: "gider Tipi",
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
                controller: giderParaController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  //cihat adamdır
                ],
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
                      controller: giderTarihController,
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
                    giderTarihController.text = tarihFormat.format(tarihSec!);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 65),
                    backgroundColor: Renkler.Black,
                    foregroundColor: Renkler.White,
                    shadowColor: Renkler.Black,
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
                String giderAdi = giderAdiController.text.trim();
                String giderTip = selectedGiderTip.trim();
                String giderPara = giderParaController.text.trim();
                String giderTarih = giderTarihController.text.trim();

                if (giderAdi.isEmpty ||
                    giderTip.isEmpty ||
                    giderPara.isEmpty ||
                    giderTarih.isEmpty) {
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
                } else if (giderTip == giderTipleri.first) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Lütfen Bir gider Tipi Seçiniz",
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
                  return; //gider Tipi Seçilmezse İşlem Sonlanır
                }

                await _databaseHelper.insertGider(
                  giderAdi,
                  giderTip,
                  int.parse(giderPara),
                  giderTarih,
                );

                // Bilgileri temizle
                giderAdiController.clear();
                giderParaController.clear();
                giderTarihController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(
                      'GİDER EKLENDİ',
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
                "GİDER EKLE",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
