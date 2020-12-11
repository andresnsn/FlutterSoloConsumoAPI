import 'package:appdesafioapi/widgets/homescreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio API GFT',
      theme: ThemeData(      
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GFT Desafio API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Color.fromARGB(255, 4, 125, 141)),
      home: HomeScreen(title: 'GFT Desafio API',)
      
    );
  }
}



