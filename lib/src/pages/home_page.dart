import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

//Mis dependencias
import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes basicos'),
      ),
      body: mostrarItems(),
    );
  }

  Widget mostrarItems() {
    return FutureBuilder(
      future: menuProvider.getData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot <List<dynamic>>snapshot) {
      
        return ListView(
          padding: EdgeInsets.all(12),  
          children: listaItems(snapshot.data),
        );
      },
    );
  }

  List <Widget> listaItems(List <dynamic> data) {
    List <Widget> opciones = new List();
    
    data.forEach((element) { 
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
      );

      opciones.add(widgetTemp);
      opciones.add(Divider());
    });

    return opciones;

  }
}
