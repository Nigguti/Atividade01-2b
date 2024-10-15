import 'package:flutter/material.dart';
import 'package:mobile/crud/cadastro.dart';
import 'package:mobile/crud/contas.dart';
import 'package:mobile/crud/user.dart';

class Listagem extends StatefulWidget {
  @override
  _ListagemState createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  final Contas apiService = ApiAccountService();
  List<conta> contas = []; 

  @override
  void initState() {
    super.initState();
    _carregaContas();
  }

  Future<void> _carregaContas() async {
    contas = await apiService.getContas();
    setState(() {});
  }

  Future<void> _adicionarContas(conta conta) async {
    await apiService.createContas(conta);
    _carregaContas();
  }

  Future<void> _atualizarContas(conta conta) async {
    await apiService.updateContas(conta);
    _carregaContas();
  }

  Future<void> _deletarContas(int id) async {
    await apiService.deleteContas(id);
    _carregaContas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contas')),
      body: Column(
        children: [
          Cadastro(onSave: _adicionarContas),
          Expanded(
            child: ListView.builder(
              itemCount: contas.length,
              itemBuilder: (context, index) {
                final conta = contas[index];
                return ListTile(
                  title: Text(conta.nome),
                  subtitle: Text('Saldo: ${conta.balanco.toString()}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _atualizarContas(conta);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deletarContas(conta.id!),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}