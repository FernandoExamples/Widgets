import 'package:flutter/material.dart';

/*
 * Clase ejemplo donde se crea un ListView de dos maneras diferentes
 */
class HomePageTemp extends StatelessWidget {
  List<String> options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      body: ListView(children: _createItemsShort()),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = List();

    for (String op in options) {
      list
        ..add(ListTile(
          title: Text(op),
        ))
        ..add(Divider());
    }

    return list;
  }

  List<Widget> _createItemsShort() {
    List<Widget> list = options.map((String item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.access_alarm),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();

    return list;
  }
}
