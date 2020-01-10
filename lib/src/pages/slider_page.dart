import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final _min = 10.0;
  final _max = 300.0;
  double _slideValue;
  bool _active;

  @override
  void initState() {
    super.initState();
    _slideValue = (_min + _max) / 2;
    _active = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        child: _createBody(),
      ),
    );
  }

  Widget _createBody() {
    return Column(
      children: <Widget>[
        _createSlider(),
        _createcheckBox(),
        _createSwitch(),
        Expanded(child: _createImage()),
      ],
    );
  }

  Widget _createSlider() {
    return Slider(
      min: _min,
      max: _max,
      value: _slideValue,
      label: 'Tamaño de la imagen',
      activeColor: Colors.indigo,
      divisions: 20,
      onChanged: _active
          ? (value) {
              setState(() {
                _slideValue = value;
              });
            }
          : null,
    );
  }

  Widget _createImage() {
    return FadeInImage(
      image: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/en/8/87/Batman_DC_Comics.png'),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fadeInDuration: Duration(milliseconds: 200),
      width: _slideValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createcheckBox() {
    return CheckboxListTile(
      value: _active,
      onChanged: (bool value) {
        setState(() {
          _active = value;
        });
      },
      title: Text('Activar con Checkbox'),
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      value: _active,
      onChanged: (bool value) {
        setState(() {
          _active = value;
        });
      },
      title: Text('Activar con Switch'),
    );
  }
}
