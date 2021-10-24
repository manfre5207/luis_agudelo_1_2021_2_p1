// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
//import 'src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      //Código para cuando la ruta no está definida se redirecciona.
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings.name}');

        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
