import 'dart:convert';
import 'package:appdesafioapi/helper/api.dart';
import 'package:appdesafioapi/model/cliente.dart';
import 'package:flutter/material.dart';


class ClienteViewer extends StatefulWidget {
  @override
  _ClienteViewerState createState() => _ClienteViewerState();
}

class _ClienteViewerState extends State<ClienteViewer> {

  var clientes = List<Cliente>();

    _getClientes() {
    Api.getClientes().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        clientes = list.map((model) => Cliente.fromJson(model)).toList();
  });
  });
}

  _ClienteViewerState()  {
    _getClientes();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: clientes.length,
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: EdgeInsets.all(20.0), 
          child: Column(children: [
            Text('Nome: ' + clientes[index].nome),
            Text('E-mail: ' + clientes[index].email),
            Text('Senha: ' + clientes[index].senha),
            Text('Documento: ' + clientes[index].documento),
            Text('Data de cadastro: ' + clientes[index].dataCadastro)
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