import 'dart:convert';
import 'package:appdesafioapi/helper/api.dart';
import 'package:appdesafioapi/model/produto.dart';
import 'package:appdesafioapi/model/venda.dart';
import 'package:flutter/material.dart';

class VendaViewer extends StatefulWidget {
  @override
  _VendaViewerState createState() => _VendaViewerState();
}

class _VendaViewerState extends State<VendaViewer> {

  var vendas = List<Venda>();
  List<Widget> listWidget = List<Widget>();


    _getVendas() {
    Api.getVendas().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        vendas = list.map((model) => Venda.fromJson(model)).toList();
  });
  });
}

  _VendaViewerState() {
    _getVendas();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: vendas.length,
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(20.0), 
          child: Column(children: [
            Text('Id da compra: ' + vendas[index].id + '\n'),
            Text('Fornecedor\n', style: TextStyle(fontSize: 16.0,
                      fontWeight: FontWeight.w500)),
            Text('ID Fornecedor: ' + vendas[index].fornecedor.id),
            Text('Nome do fornecedor: ' + vendas[index].fornecedor.nome),
            Text('CNPJ: ' + vendas[index].fornecedor.cnpj + '\n'),
            Text('Cliente\n', style: TextStyle(fontSize: 16.0,
                      fontWeight: FontWeight.w500)),
            Text('ID Cliente: ' + vendas[index].cliente.id),
            Text('Nome: ' + vendas[index].cliente.nome),
            Text('Senha: ' + vendas[index].cliente.senha),
            Text('Documento: ' + vendas[index].cliente.documento),
            Text('Data de cadastro: ' + vendas[index].cliente.dataCadastro + '\n'),
            Text('Produtos\n', style: TextStyle(fontSize: 16.0,
                      fontWeight: FontWeight.w500)),
            Column(children: _buildarLista(vendas[index].produtos))
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
            
              _buildarLista(produtos) {
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