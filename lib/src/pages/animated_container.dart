import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _height = 50.0;
  double _width = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _border = new BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.fastLinearToSlowEaseIn,
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _border,
          ),
        ),
      ),
      floatingActionButton: _btnAnimar(),
    );
  }

  Widget _btnAnimar() {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: () {
        Random _random = Random();
        setState(() {
          _height = _random.nextInt(100).toDouble();
          _width = _random.nextInt(100).toDouble();
          _border = BorderRadius.circular(_random.nextInt(50).toDouble());
          _color = Color.fromRGBO(
            _random.nextInt(250),
            _random.nextInt(250),
            _random.nextInt(250),
            1,
          );
        });
      },
    );
  }
}
