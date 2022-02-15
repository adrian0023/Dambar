
class LineaComandas {
  List<LineaComanda> items = [];
  LineaComandas();
  LineaComandas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final linComanda = new LineaComanda.fromJsonMap(item);
      items.add(linComanda);
    }
  }
}

class LineaComanda {
  int? codComanda;
  late String producto;

  LineaComanda( 
      {
      required this.codComanda,
      required this.producto
      }
      );

  LineaComanda.fromJsonMap(Map<String, dynamic> json) {
    codComanda = json['id'];
    String producto = json['producto'];
  }
}
