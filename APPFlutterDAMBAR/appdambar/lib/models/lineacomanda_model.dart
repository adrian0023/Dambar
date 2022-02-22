import 'package:appdambar/models/producto_model.dart';

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
  int? cantidad;
  dynamic producto;

  LineaComanda({this.codComanda, this.cantidad, this.producto});

  LineaComanda.fromJsonMap(Map<String, dynamic> json) {
    codComanda = json['id_comanda'];
    cantidad = json['cantidad'];
    print(json['productos']);
    if (json['productos'] != null) {
      producto = (Producto.fromJson(json['productos'])) as Producto?;
      print("producto");
    }
  }

  getproducto() {
    return producto;
  }
}
