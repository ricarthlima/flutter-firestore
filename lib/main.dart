import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Firestore',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Instancia do banco Cloud Firestore

  TextEditingController _textController = TextEditingController();
  List<String> listNames = [];

  @override
  void initState() {
    // Atualização Inicial

    // Atualização em Tempo Real

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha pequena agenda"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => refresh(),
        child: Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Vamos gravar um nome na nuvem?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: "Insira um nome"),
            ),
            ElevatedButton(
              onPressed: () => sendData(),
              child: Text("Enviar"),
            ),
            SizedBox(
              height: 16,
            ),
            (listNames.length == 0)
                ? Text(
                    "Nenhum contato registrado",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  )
                : Column(
                    children: [
                      for (String s in listNames) Text(s),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  void refresh() async {
    // Atualização manual
  }

  void sendData() {
    //Geração do ID
    String id = Uuid().v1();

    //Feedback visual
    _textController.text = "";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Salvo no Firestore!"),
      ),
    );
  }
}
