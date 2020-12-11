import 'package:appdesafioapi/model/produto.dart';

import 'cliente.dart';
import 'fornecedor.dart';

class Venda {
  String id;
  Fornecedor fornecedor;
  Cliente cliente;
  List<Produto> produtos;
  String totalCompra;
  String dataCompra;

  Venda(
      {this.id,
      this.fornecedor,
      this.cliente,
      this.produtos,
      this.totalCompra,
      this.dataCompra});

  Venda.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    fornecedor = json['fornecedor'] = new Fornecedor.fromJson(json['fornecedor']);
    cliente = new Cliente.fromJson(json['cliente']);
    produtos = new List<Produto>();
      json['produtos'].forEach((produto) {
        produtos.add(new Produto.fromJson(produto));
      });
    totalCompra = json['total_compra'].toString();
    dataCompra = json['data_compra'];
    
  }
}