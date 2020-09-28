import 'package:flutter/material.dart';


//Mis dependencias
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/home_page.dart';

Map <String, WidgetBuilder> getApplicationRoutes(){
  return <String,WidgetBuilder>{
        '/'     : (BuildContext context) => HomePage(),
        'alert' : (BuildContext context) => AlertPage(),
        'card'  : (BuildContext context) => CardPage()
  };
}