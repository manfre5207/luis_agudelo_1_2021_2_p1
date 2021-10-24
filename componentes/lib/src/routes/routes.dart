import 'package:componentes/src/pages/dogs_page.dart';
import 'package:componentes/src/pages/dogsimg_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => DogsScreen(),
    'avatar': (BuildContext context) => DogsScreenImg(),
    'card': (BuildContext context) => DogsScreenImg(),
  };
}
