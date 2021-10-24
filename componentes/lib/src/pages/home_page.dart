// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_function_literals_in_foreach_calls, unused_import

import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/Utils/icono_string_util.dart';
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de razas'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error'));
        }

        if (!snapshot.hasData) {
          return Center(child: Text('No hay data'));
        }

        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> options = [];

    data?.forEach((opt) {
      final tmp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          /*final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);*/
        },
      );

      options
        ..add(tmp)
        ..add(Divider());
    });

    return options;
  }
}
