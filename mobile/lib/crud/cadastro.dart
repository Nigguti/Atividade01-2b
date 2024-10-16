import 'package:flutter/material.dart';
import 'package:mobile/crud/user.dart';

class Cadastro extends StatelessWidget {
  final Function(Conta) onSave;

  Cadastro({required this.onSave});

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController balancoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome da Conta'),
            ),
            TextField(
              controller: balancoController,
              decoration: InputDecoration(labelText: 'Balanço Inicial'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final novaConta = Conta(
                  nome: nomeController.text,
                  balanco: double.parse(balancoController.text),
                );
                onSave(novaConta);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}