import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valor = 100;
  bool _valorBlock = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Column(
        children: [
          _crearSlider(),
          _blockImage(),
          _blockImageSwitch(),
          _mostrarImagen(),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.red,
      label: 'Tamaño de la imagen',
      value: _valor,
      max: 350,
      min: 10,
      onChanged: _valorBlock ? null : (value){
        setState(() {
          _valor = value;
        });
      }
    );
  }

  Widget _mostrarImagen() {
    return Image(
      image: NetworkImage(
          'https://i.pinimg.com/originals/56/11/a5/5611a51ff6ac04fbba537bb52d9d5a6c.jpg'),
      fit: BoxFit.contain,
      width: _valor,
    );
  }

  Widget _blockImage() {
    return CheckboxListTile(
      title: Text('Block Imagen'),
      value: _valorBlock,
      onChanged: (value){
        setState(() {
          _valorBlock = value;  
        });
      },
    );
  }

  Widget _blockImageSwitch() {
    return SwitchListTile(
      title: Text('Block Imagen'),
      value: _valorBlock,
      onChanged: (value){
        setState(() {
          _valorBlock = value;
        });
      },
    );
  }
}
