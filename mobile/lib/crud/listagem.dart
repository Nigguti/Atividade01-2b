import 'package:flutter/material.dart';
import 'package:mobile/crud/contas.dart';
import 'package:mobile/crud/user.dart'; 
import 'package:mobile/crud/cadastro.dart';


class Listagem extends StatefulWidget {
  @override
  _ListagemState createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  final ApiAccountService apiService = ApiAccountService();
  List<Conta> contas = [];

  @override
  void initState() {
    super.initState();
    _carregaContas();
  }

  Future<void> _carregaContas() async {
    contas = await apiService.getContas();
    setState(() {});
  }

  Future<void> _adicionarContas(Conta conta) async {
    await apiService.createContas(conta);
    _carregaContas();
  }

  Future<void> _atualizarContas(Conta conta) async {
    await apiService.updateContas(conta);
    _carregaContas();
  }

  Future<void> _deletarContas(int id) async {
    await apiService.deleteContas(id);
    _carregaContas();
  }

  void _editarConta(Conta conta) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Editar Conta"),
          content: Cadastro(
            onSave: (novaConta) {
  _atualizarContas(Conta(
    id: conta.id,
    nome: novaConta.nome,
    balanco: novaConta.balanco,
  ));
  Navigator.of(context).pop();
}
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contas'),
        actions: [
          IconButton(
  icon: Icon(Icons.add),
  onPressed: () async {
    final novaConta = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Cadastro(
          onSave: (conta) {
            Navigator.pop(context, conta); // Retorna a conta criada
          },
        ),
      ),
    );

    if (novaConta != null) {
      await _adicionarContas(novaConta); // Adiciona e recarrega a lista
    }
  },
)
        ],
      ),
      body: Column(
        children: [
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
                        onPressed: () => _editarConta(conta), 
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deletarContas(conta.id!), 
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}