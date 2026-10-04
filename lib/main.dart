import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txtController = TextEditingController();
  String dataQrCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            if(!dataQrCode.isEmpty) QrImageView(data: dataQrCode, size: 200),
            TextField(

              controller: txtController,
              decoration: const InputDecoration(
                labelText: 'Informe a URL para o QRCode: '
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                dataQrCode = txtController.text;
              });
            }, child: Text("Gerar QRCode"))
          ],
        ),
      ),
    );
  }
}
