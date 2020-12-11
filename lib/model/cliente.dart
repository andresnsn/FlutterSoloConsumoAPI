class Cliente {
  String id;
  String nome;
  String email;
  String senha;
  String documento;
  String dataCadastro;

  Cliente(
      {this.id,
      this.nome,
      this.email,
      this.senha,
      this.documento,
      this.dataCadastro});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
    documento = json['documento'];
    dataCadastro = json['data_cadastro'];
  }
}