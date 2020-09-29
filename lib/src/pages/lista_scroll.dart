import 'dart:async';

import 'package:flutter/material.dart';

class ListaScrollPage extends StatefulWidget {
  @override
  _ListaScrollPageState createState() => _ListaScrollPageState();
}

class _ListaScrollPageState extends State<ListaScrollPage> {
  List<int> _listaNumero = new List();
  int _contador = 0;
  ScrollController _scrollController = new ScrollController();
  //Esta variable será una bandera que indica cuando se esta cargando datos
  //y cuando no
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _cargar10();

    _scrollController.addListener(() {
      //La condicion determina si cargaron todos los pixeles
      //_scrollController determina si ya se llego al final de la pantalla 
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _cargar10();
        _fetchData();
      }
    });
  }

  //Este metodo se ejecuta justo cuando la ruta de la apliación es cerrada
  //_scrollController es destruido para no ocupar espacio en memoria
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista y Scroll'),
      ),
      body: Stack(
        //El Widget Stack lo que hace es colocar widget encima de otros
        children: [_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumero.length,
      itemBuilder: (BuildContext context, int index) {
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

//Este metodo se encarga de cargar 10 imagenes más
  void _cargar10() {
    for (var i = 0; i < 10; i++) {
      _contador++;
      _listaNumero.add(_contador);
    }
    setState(() {});
  }

//Este metodo se encarga de simular un retraso en la carga de datos
  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 5);
    return new Timer(duration, respuestaHTTP);
  }

  //Funcion que simula una peticion HTTP
  void respuestaHTTP() {
    _isLoading = false;
    _cargar10();

    //_scrollController cuando sabe que todas las imagenes ya cargaron
    //Lo que hace es desplazarlas hacia arriba para poderlas ver
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: new Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  //Si la carga de imagenes se esta ejecutando se muestra un widget
  //CircularProgressIndicator
  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
