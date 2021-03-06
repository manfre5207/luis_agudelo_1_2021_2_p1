import 'dart:convert';
import 'package:componentes/src/models/dogs.dart';
import 'package:componentes/src/models/response.dart';
import 'package:http/http.dart' as http;

import 'constans.dart';

class ApiHelper {
  static Future<Response> getProcedures() async {
    var url = Uri.parse('${Constans.apiUrl}/api/breeds/list/all');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );

    var body = response.body;
    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }

    List<Dogs> list = [];
    var decodedJson = jsonDecode(body);
    if (decodedJson != null) {
      for (var item in decodedJson) {
        list.add(Dogs.fromJson(item));
      }
    }

    return Response(isSuccess: true, result: list);
  }
}
