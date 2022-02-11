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
          _productosMesa(),
          _productosMesa(),
          _productosMesa(),
          _productosMesa(),
          _productosMesa(),
          _productosMesa(),
          _productosMesa(),
          Divider(),
          _botonAnyadirProductos(),
          Divider(),
          _botonEliminarProducto(),
          Divider(),
          _botonAnyadirProductos(),
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
    return (Text('Mesa: Nº1'));
  }

  Widget _productosMesa() {
    return (Text('Productos'));
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
