import 'package:appdesafioapi/helper/api.dart';
import 'package:appdesafioapi/model/fornecedor.dart';
import 'package:appdesafioapi/model/produto.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class FornecedorViewer extends StatefulWidget {
  @override
  _FornecedorViewerState createState() => _FornecedorViewerState();
}

class _FornecedorViewerState extends State<FornecedorViewer> {

  var fornecedores = List<Fornecedor>();
  List<Widget> listWidget = List<Widget>();
  
  _getFornecedores() {
    Api.getFornecedores().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        fornecedores = list.map((model) => Fornecedor.fromJson(model)).toList();
  });
  });
}

  _FornecedorViewerState() {
    _getFornecedores();
  }


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
    itemCount: fornecedores.length,
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(20.0), 
          child: Column(children: [
            Text('Id: ' + fornecedores[index].id),
            Text('Nome: ' + fornecedores[index].nome),
            Text('CNPJ: ' + fornecedores[index].cnpj),
            Text('\nProdutos:\n', style: TextStyle(fontSize: 16.0,
                      fontWeight: FontWeight.w500),),
            Column(children: _buildarLista(fornecedores[index].produtos))         
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
            
              _buildarLista(List<Produto> produtos) {
                listWidget.clear();
                for(Produto produto in produtos){
                    listWidget.add(Text('Id: ' + produto.id));
                    listWidget.add(Text('Nome: ' + produto.nome));
                    listWidget.add(Text('Código do produto: ' + produto.imagem));
                    listWidget.add(Text('Valor: ' + produto.valor));
                    listWidget.add(Text('Promoção: ' + produto.promocao));
                    listWidget.add(Text('Valor promocional: ' + produto.valorPromo));
                    listWidget.add(Text('Categoria: ' + produto.categoria));
                    listWidget.add(Text('Imagem: ' + produto.imagem));
                    listWidget.add(Text('Quantidade: ' + produto.quantidade + '\n'));
                }
                return listWidget;
              }
            

}