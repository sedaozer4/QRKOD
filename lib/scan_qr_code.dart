import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult = 'Taranan veriler burada görünecek';
  Future<void> scanQR()async{
   try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'İptal', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrResult = qrCode.toString();
      });


   }on PlatformException{
      qrResult = 'QR Kod Okunamadı!';
   }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URL açılmıyor! : $url';
    }
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    Fluttertoast.showToast(
      msg: "URL panoya kopyalandı",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('QR Kodu Tara'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 38,),
            GestureDetector(
              onTap: () {
                if (qrResult != 'Taranan veriler burada görünecek' && qrResult != 'QR Kod Okunamadı!') {
                  _launchURL(qrResult);
                  _copyToClipboard(qrResult);
                }
              },
              child: Text(
                '$qrResult',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 38),
            ElevatedButton(onPressed: scanQR, child: Text('Kodu Tara')),
          ],

        ),
      ),
    );
  }
}
