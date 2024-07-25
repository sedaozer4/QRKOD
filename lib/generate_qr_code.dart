import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Kod Oluştur'),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(urlController.text.isNotEmpty)
                QrImageView(data: urlController.text, size: 200.0,),
              SizedBox(height: 18,),
              Container(
                padding: EdgeInsets.only(left: 18, right: 18),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: ' Verilerinizi giriniz',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    labelText: 'Verilerinizi giriniz',
                  ),
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){setState(() {

              });}, child: Text('QR Kod Oluştur')),
            ],
          ),
        ),
      ),
    );
  }
}
