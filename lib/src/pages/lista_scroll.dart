import 'package:flutter/material.dart';

class ListaScrollPage extends StatefulWidget {
  @override
  _ListaScrollPageState createState() => _ListaScrollPageState();
}

class _ListaScrollPageState extends State<ListaScrollPage> {
  
  List <int> _listaNumero = new List();
  int _contador = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _cargar10();

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _cargar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista y Scroll'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumero.length,
      itemBuilder: (BuildContext context, int index){
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/id/$index/500/300'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fit: BoxFit.cover,
          fadeInDuration: Duration(seconds: 2),
          height: 300,
          width: 500,
        );
      },

    );
  }

  void _cargar10(){
    for (var i = 0; i < 10; i++) {
    
      _contador++;
      _listaNumero.add(_contador);
    }
    setState(() {});
  }

}

