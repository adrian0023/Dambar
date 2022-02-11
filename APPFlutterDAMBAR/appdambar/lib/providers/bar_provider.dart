import 'dart:convert';

import 'package:appdambar/models/mesa_model.dart';

import 'package:http/http.dart' as http;

class BarProvider {
  String _url = 'https://my-json-server.typicode.com/adrian0023/Dambar';
  List<Mesa> mesas = [];

  Future<List<Mesa>> _getmesas(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final mesas = Mesas.fromJsonList(decodedData['results']);
    return mesas.items;
  }
}
