import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/crud/user.dart';

abstract class Contas {
  Future<List<conta>> getContas();
  Future<conta> createContas(conta account);
  Future<conta> updateContas(conta account);
  Future<void> deleteContas(int id);
}

class ApiAccountService extends Contas {

  @override
  Future<List<conta>> getContas() async {
    final response = await http.get(Uri.parse("http://localhost:3000/usuario"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((account) => conta.fromJson(account)).toList();
    } else {
      throw Exception('Falha ao trazer as contas');
    }
  }

  @override
  Future<conta> createContas(conta account) async {
    final response = await http.post(
      Uri.parse("http://localhost:3000/usuario"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(account.toJson()),
    );
    if (response.statusCode == 201) {
      return conta.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha em criar a conta');
    }
  }

  @override
  Future<conta> updateContas(conta account) async {
    final response = await http.put(
      Uri.parse("http://localhost:3000/usuario/${account.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(account.toJson()),
    );
    if (response.statusCode == 200) {
      return conta.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha em atualizar a conta');
    }
  }

  @override
  Future<void> deleteContas(int id) async {
    final response = await http.delete(Uri.parse("http://localhost:3000/usuario/$id"));
    if (response.statusCode != 200) {
      throw Exception('Falha em deletar a conta');
    }
  }
}


