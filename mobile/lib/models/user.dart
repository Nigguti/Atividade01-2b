class User {
  final int id;
  final String nome;
  final double saldo;

  User({
    required this.id,
    required this.nome,
    required this.saldo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int, 
      nome: json['nome'] as String, 
      saldo: (json['saldo'] as num).toDouble()
      );
  }
}
