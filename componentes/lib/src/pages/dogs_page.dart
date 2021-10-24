// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:componentes/src/components/loader_component.dart';
import 'package:componentes/src/helpers/constans.dart';
import 'package:componentes/src/models/dogs.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class DogsScreen extends StatefulWidget {
  @override
  DogsScreenState createState() => DogsScreenState();
}

class DogsScreenState extends State<DogsScreen> {
  List<Dogs> _dogs = [];
  bool _showLoader = false;
  bool _isFiltered = false;

  @override
  void initState() {
    super.initState();
    _getProcedures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogs'),
      ),
      body: Center(
        child: _showLoader
            ? LoaderComponent(text: 'Por favor espere...')
            : _getContent(),
      ),
    );
  }

  void _getProcedures() async {
    setState(() {
      _showLoader = true;
    });

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _showLoader = false;
      });
      await showAlertDialog(
          context: context,
          title: 'Error',
          message: 'Verifica que estes conectado a internet.',
          actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
          ]);
      return;
    }

    var url = Uri.parse('${Constans.apiUrl}/api/breeds/list/all');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );

    setState(() {
      _showLoader = false;
    });
    //print(response);

    var body = response.body;
    var decodedJson = jsonDecode(body);
    if (decodedJson != null) {
      for (var item in decodedJson) {
        _dogs.add(Dogs.fromJson(item));
      }
    }

    print(_dogs);
  }

  Widget _getContent() {
    return _dogs.length == 0 ? _noContent() : _getListView();
  }

  Widget _noContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        // ignore: prefer_const_constructors
        child: Text(
          'No hay datos.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _getListView() {
    return ListView(
      children: _dogs.map((e) {
        return InkWell(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.message,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
