import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({super.key});

  @override
  State<BarcodeScreen> createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  String _scanBarcodeResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Screen'),
      ),
      body: Builder(
        builder: (context) =>
            Container(
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: scanBarcodeNormal,
                    child: const Text('Scan barcode'),
                  ),
                  Text('Barcode Result $_scanBarcodeResult'),
                ],
              ),
            ),
      ),
    );
  }

  void scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE,);
    } on PlatformException {
      barcodeScanRes = "Failed to get platform version ";
    }
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }


}


