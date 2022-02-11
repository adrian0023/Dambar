import 'dart:ffi';

import 'package:appdambar/models/comanda_model.dart';
import 'package:appdambar/models/producto_model.dart';
import 'package:flutter/material.dart';

class comandaPage extends StatefulWidget {
  @override
  _comandaPageState createState() => _comandaPageState();
}

class _comandaPageState extends State<comandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        children: [
          Divider(),
          _banner(),
          Divider(),
          _numeroMesa(),
          Divider(),
          _productosMesa(),
          Divider(),
          _botonAnyadirProductos(),
          Divider(),
          _botonEliminarProducto(),
          Divider(),
          _botonCuenta(),
        ],
      ),
    );
  }

  Widget _banner() {
    return (Image(
      image: AssetImage('assets/img/LogoApp.PNG'),
    ));
  }

  Widget _numeroMesa() {
    Comanda comanda = Comanda();
    comanda.codMesa = 3;
    int? codMesa = comanda.codMesa;
    return (Text('Mesa: $codMesa'));
  }

  Widget _productosMesa() {
    Comanda comanda = Comanda();
    List<String> productos = ['Producto 1', 'Producto 2'];
    comanda.lineaComanda = productos;
    productos += ['Producto 3', 'Producto 4'];

    comanda.lineaComanda = productos;

    return ListView.builder(
      shrinkWrap: true,
      // Deja que ListView sepa cuántos elementos necesita para construir
      itemCount: comanda.lineaComanda!.length,
      // Proporciona una función de constructor. Vamos a
      // convertir cada elemento en un Widget basado en el tipo de elemento que es.
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [Text(comanda.lineaComanda![index])],
          ),
        );
      },
    );
  }

  Widget _botonAnyadirProductos() {
    // ignore: deprecated_member_use
    return FlatButton(
      disabledColor: Colors.blueAccent,
      child: Text("Añadir productos"),
      splashColor: Colors.blueAccent,
      color: Colors.amber,
      onPressed: () {
        print("anyadimos producto");
      },
    );
  }

  Widget _botonEliminarProducto() {
    // ignore: deprecated_member_use
    return FlatButton(
      disabledColor: Colors.blueAccent,
      child: Text("Eliminar producto"),
      splashColor: Colors.blueAccent,
      color: Colors.amber,
      onPressed: () {
        print("Eliminamos");
      },
    );
  }

  Widget _botonCuenta() {
    // ignore: deprecated_member_use
    return FlatButton(
      disabledColor: Colors.blueAccent,
      child: Text("Cuenta"),
      splashColor: Colors.blueAccent,
      color: Colors.amber,
      onPressed: () {
        print("Enviamos cuenta");
      },
    );
  }
}
