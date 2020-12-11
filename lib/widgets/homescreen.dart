import 'package:appdesafioapi/widgets/produtoviewer.dart';
import 'package:appdesafioapi/widgets/vendaviewer.dart';
import 'package:flutter/material.dart';
import 'clienteviewer.dart';
import 'fornecedorviewer.dart';


class HomeScreen extends StatefulWidget {

  final String title;

  const HomeScreen({Key key, this.title}) :super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('GFT Desafio API'),
              decoration: BoxDecoration(
                color: Colors.blue)),
            ListTile(
              title: Text('Clientes'),
              selected: 0 == _selectedIndex,
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Produtos'),
              selected: 1 == _selectedIndex,
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('Fornecedores'),
              selected: 2 == _selectedIndex,
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              title: Text('Vendas'),
              selected: 3 == _selectedIndex,
              onTap: () {
                _onSelectItem(3);
              },
            ),
          ],
        )
      ),
      body: _getDrawerItem(_selectedIndex),
    );
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return ClienteViewer();
      case 1:
        return ProdutoViewer();
      case 2:
        return FornecedorViewer();
      case 3:
        return VendaViewer();

    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).pop(context);
    });
  }
}