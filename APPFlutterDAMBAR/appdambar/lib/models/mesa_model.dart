import 'package:appdambar/models/comanda_model.dart';

class Mesas {
  List<Mesa> items = [];
  Mesas();
  Mesas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final comanda = new Mesa.fromJsonMap(item);
      items.add(comanda);
    }
  }
}

class Mesa {
  int? codMesa;
  bool? estado;
  List<Comanda>? comandas;
  Mesa({this.codMesa, this.estado, this.comandas});

  Mesa.fromJsonMap(Map<String, dynamic> json) {
    codMesa = json['codMesa'];
    estado = json['estado'];
    if (json['comandas'] != null) {
      comandas =
          (Comandas.fromJsonList(json['comandas']).items) as List<Comanda>?;
    }
  }
}
