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
  int? id;
  String? descripcion;
  String? foto;
  String? nombre;
  double? precio;
  int? stock;
  String? tipo;
  bool? pressed = false;
  Producto(
      {this.id,
      this.descripcion,
      this.foto,
      this.nombre,
      this.precio,
      this.stock,
      this.tipo});
  factory Producto.fromJson(dynamic json) {
    var foto;
    if (json['foto'] == null) {
      foto = 'https://i.ibb.co/0Jmshvb/no-image.png';
    } else {
      foto = json['foto'];
    }
    return Producto(
      id: json['id'] as int?,
      descripcion: json['descripcion'] as String?,
      foto: json['foto'] as String?,
      nombre: json['nombre'] as String?,
      precio: json['precio'] as double?,
      stock: json['stock'] as int?,
      tipo: json['tipo'] as String?,
    );
  }

  Producto.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    descripcion = json['descripcion'];
    foto = json['foto'];
    nombre = json['nombre'];
    precio = json['precio'];
    stock = json['stock'];
    tipo = json['tipo'];
  }
}
