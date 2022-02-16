import 'dart:convert';

import 'package:appdambar/models/mesa_model.dart';
import 'package:appdambar/models/producto_model.dart';

import 'package:http/http.dart' as http;

class BarProvider {
  final String urlmain = '192.168.1.14:8080';

  List<Mesa> mesas = [];

  Future<List<Mesa>> getinfoMesas() async {
    final String url_peticion = '/dambar/mesas/';
    final url = Uri.http(urlmain, url_peticion);
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    //print(decodedData);

    final listaMesas = Mesas.fromJsonList(decodedData);

    return listaMesas.items;
  }

  Future<List<Producto>> getinfoProductoAgotado() async {
    final String url_peticion = "/producto/stock";
    final Map<String, String> _queryParameters = <String, String>{
      'stock': '0',
    };
    final url = Uri.http(urlmain, url_peticion, _queryParameters);
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    //print(decodedData);

    final listaProductos = Productos.fromJsonList(decodedData);

    return listaProductos.items;
  }

  /*Future<List<Mesa>> getinfoProductosMesa(String id) async {
    final String url_peticion = "/dambar/mesa/" + id;

    final url = Uri.http(urlmain, url_peticion);
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    //print(decodedData);

    final listaMesas = Mesas.fromJsonList(decodedData);

    listaMesas.;
  }*/
}
