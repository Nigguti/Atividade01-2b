import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/models/user.dart';

class ApiService {

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse("http://localhost:3000/usuario"));

    if(response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users = body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    }else{
      throw Exception('Falha ao carregar os usuários');
    }
  }

  Future<User> getUser(int id) async {
    final response = await http.get(Uri.parse("http://localhost:3000/usuario/$id"));

    if(response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('Falha ao carregar o usuário');
    }
  }

  Future<User> createUser(String nome, double saldo) async {
    final response = await http.post(Uri.parse("http://localhost:3000/usuario"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'nome': nome, 'saldo': saldo}),
    );

    if(response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('Falha ao criar o usuário');
    }
  }

  Future<User> updateUser(int id, String nome, double saldo) async {
    final response = await http.put(Uri.parse("http://localhost:3000/usuario/$id"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'nome': nome, 'saldo': saldo}),
    );

    if(response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('Falha ao atualizar o usuário');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse("http://localhost:3000/usuario/$id"));

    if(response.statusCode != 200) {
      throw Exception('Falha ao deletar o usuário');
    }
  }
}
