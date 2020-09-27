import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  Future <List<dynamic>> getData() async{

    final resp =  await rootBundle.loadString('data/menu_opts.json');
    Map data = json.decode(resp);
    
    opciones = data['rutas'];
    return opciones;
  }

}

final menuProvider = _MenuProvider();