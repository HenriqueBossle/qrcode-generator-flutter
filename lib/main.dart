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
      title: 'Gerador de QRCode',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 16, 32, 172)),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Gerador de QRCode dinâmico'),
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
            Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
            ),
            TextField(
              controller: txtController,
              decoration: const InputDecoration(
                labelText: 'Informe a URL para o QRCode: ',
               
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                dataQrCode = txtController.text;
              });
              
            },

            
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Cor de fundo do botão
              foregroundColor: Colors.white, // Cor do texto ou ícone
            ),
            
            child: 
            Text("Gerar QRCode")
            )
          ],
        ),
      ),
    );
  }
}
