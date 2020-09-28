import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          children: [
            _itemCard(),
            SizedBox(
              height: 15,
            ),
            _itemCard(),
            SizedBox(
              height: 15,
            ),
            _itemCard2(),
            SizedBox(
              height: 15,
            ),
            _itemCard2(),
            _itemCard(),

          ]),
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
                SizedBox(
                  width: 20,
                ),
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

  Widget _itemCard2() {
    final container = Container(
      color: Colors.blue,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://i.pinimg.com/originals/25/79/11/257911f2e20a88f67c73e1054316acac.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Lago el gato',style: TextStyle(fontSize: 18),),
          ),
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        child: container,
        borderRadius: BorderRadius.circular(20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 7,
            offset: Offset(5, 5)
          ),
        ]
      ),
    );
  }
}
