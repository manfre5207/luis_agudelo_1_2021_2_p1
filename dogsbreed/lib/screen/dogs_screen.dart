import 'dart:convert';

import 'package:dogsbreed/components/loader_component.dart';
import 'package:dogsbreed/helpers/constans.dart';
import 'package:http/http.dart' as http;

import 'package:dogsbreed/models/dogs.dart';
import 'package:flutter/material.dart';

class DogsScreen extends StatefulWidget {
  @override
  DogsScreenState createState() => DogsScreenState();
}

class DogsScreenState extends State<DogsScreen> {
  List<Dogs> _dogs = [];
  bool _showLoader = false;

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
            : Text('Perros'),
      ),
    );
  }

  void _getProcedures() async {
    setState(() {
      _showLoader = true;
    });

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
}
