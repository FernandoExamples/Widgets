import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  final _PATH = 'data/menu_opts.json';

  List<dynamic> options = [];

  _MenuProvider() {
    // loadData();
  }

  Future<List<dynamic>> loadData() async {
    var resp = await rootBundle.loadString(_PATH);
    Map dataMap = json.decode(resp);
    options = dataMap[JSON_MENU];

    return options;
  }
}

final menuProvider = _MenuProvider();

final JSON_MENU = 'menus';
final JSON_ICON = 'icon';
final JSON_TITLE = 'texto';
final JSON_ROUTE = 'ruta';
