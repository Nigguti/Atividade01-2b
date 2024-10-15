class conta {
  int? id;
  String nome;
  double balanco;

  conta({this.id, required this.nome, required this.balanco});

  factory conta.fromJson(Map<String, dynamic> json) {
    return conta(
      id: json['id'],
      nome: json['nome'],
      balanco: json['balanco'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'balanco': balanco,
    };
  }
}