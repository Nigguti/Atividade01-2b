import 'package:flutter/material.dart';
import 'package:mobile/crud/cadastro.dart';
import 'package:mobile/crud/listagem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Principal'),
      ),
      body: Listagem(),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Cadastro(
          onSave: (novaConta) {
            print('Conta salva: ${novaConta.nome}, Balanço: ${novaConta.balanco}');
          },
        ),
      ),
    );
  },
  child: Icon(Icons.add),
),
    );
  }
}




