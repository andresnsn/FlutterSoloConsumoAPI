import 'package:appdesafioapi/helper/api.dart';
import 'package:appdesafioapi/model/produto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ProdutoViewer extends StatefulWidget {
  @override
  _ProdutoViewerState createState() => _ProdutoViewerState();
}

class _ProdutoViewerState extends State<ProdutoViewer> {

  var produtos = List<Produto>();
    
  _getProdutos() {
    Api.getProdutos().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        produtos = list.map((model) => Produto.fromJson(model)).toList();
    });
  });
}

  _ProdutoViewerState() {
    _getProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: produtos.length,
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(20.0), 
          child: Column(children: [
            Text('Id: ' + produtos[index].id),
            Text('Nome: ' + produtos[index].nome),
            Text('Código do produto: ' + produtos[index].codigoProduto),
            Text('Valor: R\$' + produtos[index].valor),
            Text('Promoção:' + produtos[index].promocao),
            Text('Valor promocional: ' + produtos[index].valorPromo),
            Text('Categoria:' + produtos[index].categoria),
            Text('Imagem: ' + produtos[index].imagem),
            Text('Quantidade:' + produtos[index].quantidade)
          ],),)
      );
    /*return ListTile(
      title: Text(
        users[index].nome,
        style: TextStyle(fontSize: 20.0, color: Colors.black)
        ),
        );*/
  }
  );
  }
}