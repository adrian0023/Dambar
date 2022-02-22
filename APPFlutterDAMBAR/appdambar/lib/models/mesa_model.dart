import 'package:appdambar/models/comanda_model.dart';

class Mesas {
  List<Mesa> items = [];
  Mesas();
  Mesas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final mesa = new Mesa.fromJsonMap(item);
      items.add(mesa);
    }
  }
}

class Mesa {
  int? codMesa;
  bool? estado;
  Mesa({this.codMesa, this.estado});

  Mesa.fromJsonMap(Map<String, dynamic> json) {
    codMesa = json['codMesa'];
    estado = json['estado'];
  }
}
