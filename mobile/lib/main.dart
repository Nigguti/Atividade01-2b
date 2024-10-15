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
      home: Listagem(),
    );
  }
}


