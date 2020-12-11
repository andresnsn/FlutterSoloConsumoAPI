import 'package:appdesafioapi/model/produto.dart';

class Fornecedor {
  String id;
  String nome;
  String cnpj;
  List<Produto> produtos;
  List<Fornecedor> fornecedores = List<Fornecedor>();

  Fornecedor({this.id, this.nome, this.cnpj, this.produtos});

  Fornecedor.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    nome = json['nome'];
    cnpj = json['cnpj'];
        if (json['produtos'] != null) {
      produtos = new List<Produto>();
      json['produtos'].forEach((v) {
        produtos.add(new Produto.fromJson(v));
      });
    
  }
    
}
}