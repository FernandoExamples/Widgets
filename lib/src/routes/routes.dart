import 'package:flutter/material.dart';
import 'package:widgets/src/pages/alerts_page.dart';
import 'package:widgets/src/pages/animated_container_page.dart';
import 'package:widgets/src/pages/avatar_page.dart';
import 'package:widgets/src/pages/cards_page.dart';
import 'package:widgets/src/pages/home_page.dart';
import 'package:widgets/src/pages/inputs_page.dart';
import 'package:widgets/src/pages/list_page.dart';
import 'package:widgets/src/pages/slider_page.dart';

Map getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (context) => HomePage(),
    'avatar': (context) => AvatarPage(),
    'alert': (context) => AlertsPage(),
    'card': (context) => CardsPage(),
    'animated': (context) => AnimatedContainerPage(),
    'inputs': (context) => InputFieldsPage(),
    'slider': (context) => SliderPage(),
    'list': (context) => ListPage(),
  };
}
