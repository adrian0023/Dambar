import 'dart:ffi';

class Productos {
  List<Producto> items = [];
  Productos();
  Productos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final producto = new Producto.fromJsonMap(item);
      items.add(producto);
    }
  }
}

class Producto {
  String? id;
  String? descripcion;
  String? foto;
  String? nombre;
  Float? precio;
  int? stock;
  String? tipo;
  Producto(
      {this.id,
      this.descripcion,
      this.foto,
      this.nombre,
      this.precio,
      this.stock,
      this.tipo});

  Producto.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    descripcion = json['descripcion'];
    foto = json['foto'];
    nombre = json['nombre'];
    precio = json['price'];
    stock = json['stock'];
    tipo = json['tipo'];
  }
}