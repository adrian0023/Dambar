import 'package:appdambar/models/lineacomanda_model.dart';
import 'package:appdambar/models/mesa_model.dart';
import 'package:flutter/foundation.dart';

import 'mesa_model.dart';
import 'mesa_model.dart';

class Comandas {
  List<Comanda> items = [];
  Comandas();
  Comandas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final comanda = new Comanda.fromJsonMap(item);
      items.add(comanda);
    }
  }
}

class Comanda {
  int? codComanda;
  int? codCamarero;
  Mesa? mesa;
  DateTime? fechaPedido;
  bool? pagado;
  List<LineaComanda>? lineaComanda;

  Comanda(
      {this.codComanda,
      this.codCamarero,
      this.mesa,
      this.fechaPedido,
      this.pagado,
      this.lineaComanda});

  Comanda.fromJsonMap(Map<String, dynamic> json) {
    codComanda = json['codComanda'];
    codCamarero = json['camarero'];
    mesa = json['mesa'];
    fechaPedido = json['nombre'];
    pagado = json['pagado'];
    lineaComanda = json['lineas'];
  }

  factory Comanda.fromJson(dynamic json) {
    return Comanda(
        codComanda: json['codComanda'],
        codCamarero: json['camarero'],
        mesa: json['mesa'],
        fechaPedido: json['nombre'],
        pagado: json['pagado'],
        lineaComanda: json['lineas']);
  }
}
