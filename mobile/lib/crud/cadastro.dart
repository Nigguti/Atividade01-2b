import 'package:flutter/material.dart';
import 'package:mobile/crud/user.dart';

class Cadastro extends StatefulWidget {
  final Function(conta) onSave;

  Cadastro({required this.onSave});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = TextEditingController();
  final _balancoController = TextEditingController();

  void _submit() {
    final nome = _nomeController.text;
    final balanco = double.tryParse(_balancoController.text) ?? 0.0;

    if (nome.isNotEmpty && balanco > 0) {
      widget.onSave(conta(nome: nome, balanco: balanco)); 
      _nomeController.clear();
      _balancoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nomeController,
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: _balancoController,
            decoration: InputDecoration(labelText: 'Saldo'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submit,
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
