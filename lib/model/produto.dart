class Produto {
  String id;
  String nome;
  String codigoProduto;
  String valor;
  String promocao;
  String valorPromo;
  String categoria;
  String imagem;
  String quantidade;
 String get getId => id;



  Produto(
      {this.id,
      this.nome,
      this.codigoProduto,
      this.valor,
      this.promocao,
      this.valorPromo,
      this.categoria,
      this.imagem,
      this.quantidade});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    nome = json['nome'];
    codigoProduto = json['codigo_produto'];
    valor = json['valor'].toString();
    promocao = json['promocao'].toString();
    valorPromo = json['valor_promo'].toString();
    categoria = json['categoria'];
    imagem = json['imagem'];
    quantidade = json['quantidade'].toString();
  }


}