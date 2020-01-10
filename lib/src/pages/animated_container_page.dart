import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _heigth = 50.0;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);
  Color _color = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: _createBody(_width, _heigth, _borderRadius, _color),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _changeProperties,
        label: Text('Animate'),
        icon: Icon(Icons.movie),
      ),
    );
  }

  Widget _createBody(
    double width,
    double heigth,
    BorderRadiusGeometry borderRadius,
    Color color,
  ) {
    return Center(
      child: AnimatedContainer(
        width: width,
        height: heigth,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color,
        ),
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void _changeProperties() {
    Random random = Random();

    setState(() {
      _width = random.nextInt(300).toDouble();
      _heigth = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );

      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
