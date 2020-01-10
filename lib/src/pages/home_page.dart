import 'package:flutter/material.dart';
import 'package:widgets/src/providers/menu_provider.dart';
import 'package:widgets/src/utils/icons_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widgets')),
      body: _createListView(),
    );
  }

  Widget _createListView() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createItems(List<dynamic> menus, BuildContext context) {
    List<Widget> options = [];

    menus.forEach((menu) {
      var widTemp = ListTile(
        title: Text(menu[JSON_TITLE]),
        trailing: Icon(Icons.arrow_forward_ios),
        leading: getIcon(menu[JSON_ICON]),
        onTap: () {
          // var route = MaterialPageRoute(
          //   builder: (context) => AlertsPage(),
          // );

          // Navigator.push(context, route);

          Navigator.pushNamed(context, menu[JSON_ROUTE]);
        },
      );

      options..add(widTemp)..add(Divider());
    });

    return options;
  }
}
