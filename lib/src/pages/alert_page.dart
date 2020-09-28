import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alert'),
          onPressed: () => _mostrarAlerta(context),
          shape: StadiumBorder(),
          color: Colors.blue,
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                isThreeLine: true,
                title: Text('Alerta',style: TextStyle(fontSize: 30),),
                subtitle: Text('Informació que va a mostrar el alerta, aqui va toda la informacion necesaria'),
              ),
              FlutterLogo(
                size: 80,
              ),
            ],
          ),
          actions: [
            FlatButton(child: Text('Cancelar'), onPressed: () => Navigator.pop(context),),
            FlatButton(child: Text('ok'),onPressed: (){},),
          ],
        );
      }
    );
  }
}
