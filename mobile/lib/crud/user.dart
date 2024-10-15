class Conta {
  final int? id;
  final String nome;
  final double balanco;

  Conta({this.id, required this.nome, required this.balanco});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'balanco': balanco,
    };
  }

  factory Conta.fromJson(Map<String, dynamic> json) {
    return Conta(
      id: json['id'],
      nome: json['nome'],
      balanco: json['balanco'],
    );
  }
}