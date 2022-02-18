import 'dart:ffi';

import 'package:appdambar/models/producto_model.dart';
import 'package:appdambar/providers/bar_provider.dart';
import 'package:flutter/material.dart';

class productoPage extends StatefulWidget {
  @override
  _productoPageState createState() => _productoPageState();
}

class _productoPageState extends State<productoPage> {
  List<Producto> productos = [];
  List<Producto> productosSelec = [];
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          children: [
            Divider(),
            Column(
              children: [_banner(), _crearProductos()],
            ),
          ]),
    );
  }

  //banner con logo del bar
  Widget _banner() {
    return (Image(
      image: AssetImage('assets/img/LogoApp.PNG'),
    ));
  }

  Widget _crearProductos() {
    final barprovider = BarProvider();

    return FutureBuilder(
        future: barprovider.getinfoProductoAgotado(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return listaProductos(snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget listaProductos(List<dynamic> productos) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (BuildContext context, int index) {
                  // return item
                  return ProductotItem(
                    productos[index].id,
                    productos[index].descripcion,
                    productos[index].foto,
                    productos[index].nombre,
                    productos[index].precio,
                    productos[index].stock,
                    productos[index].tipo,
                    productos[index].pressed!,
                    index,
                  );
                }),
          ),
          productosSelec.length > 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: Colors.green[700],
                      child: Text(
                        "Delete (${productosSelec.length})",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        print("Delete List Lenght: ${productosSelec.length}");
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget ProductotItem(
      int? id,
      String? descripcion,
      String? foto,
      String? nombre,
      double? precio,
      int? stock,
      String? tipo,
      bool pressed,
      int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        nombre!,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(descripcion!),
      trailing: pressed
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          productos[index].pressed = productos[index].pressed;
          if (productos[index].pressed == true) {
            productosSelec.add(Producto(
                /* id,  descripcion,  foto,  nombre,  precio,  stock,  tipo, true*/));
          } else if (productos[index].pressed == false) {
            productosSelec.removeWhere(
                (element) => element.nombre == productos[index].nombre);
          }
        });
      },
    );
  }
}
