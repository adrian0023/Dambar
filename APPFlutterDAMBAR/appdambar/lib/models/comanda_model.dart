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
  int? codMesa;
  DateTime? fechaPedido;
  bool? pagado;

  Comanda(
      {this.codComanda,
      this.codCamarero,
      this.codMesa,
      this.fechaPedido,
      this.pagado});

  Comanda.fromJsonMap(Map<String, dynamic> json) {
    codComanda = json['id'];
    codCamarero = json['descripcion'];
    codMesa = json['foto'];
    fechaPedido = json['nombre'];
    pagado = json['price'];
  }
}
