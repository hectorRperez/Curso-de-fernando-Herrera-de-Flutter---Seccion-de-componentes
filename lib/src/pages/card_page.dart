import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        children: [
          _itemCard(),
          _itemCard(),
        ]
      ),
    );
  }

  Widget _itemCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ListTile(
            leading: FlutterLogo(
              size: 25,
            ),
            title: Text('Titulo de la tarjeta'),
            isThreeLine: true,
            subtitle: Text(
                'Aqui va toda la información adicional de la tarjeta. esto es un ejemplo'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text('Cancelar'),
                ),
                SizedBox(width: 20,),
                FlatButton(
                  onPressed: () {},
                  child: Text('Ok'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
