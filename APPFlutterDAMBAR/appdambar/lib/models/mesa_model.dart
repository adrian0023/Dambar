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
  Mesa(int codmesa, bool estado) {
    this.codMesa = codMesa;
    this.estado = estado;
  }

  Mesa.fromJsonMap(Map<String, dynamic> json) {
    codMesa = json['id'];
    estado = json['descripcion'];
  }
}
