// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_element

import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      //body: ListView(children: _crearItems()),
      body: ListView(children: _crearItemCorta()),
    );
  }

//Primer tipo de lista
  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista.add(tempWidget);
      lista.add(Divider());
    }
    return lista;
  }

//segundo tipo de lista
  List<Widget> _crearItemCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Perro'),
            leading: Icon(Icons.account_box_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
