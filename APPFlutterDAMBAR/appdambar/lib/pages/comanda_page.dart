// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:appdambar/models/comanda_model.dart';
import 'package:appdambar/models/lineacomanda_model.dart';
import 'package:appdambar/models/mesa_model.dart';
import 'package:appdambar/models/producto_model.dart';
import 'package:appdambar/pages/productos_page.dart';
import 'package:appdambar/providers/bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class comandaPage extends StatefulWidget {
  @override
  _comandaPageState createState() => _comandaPageState();
}

class _comandaPageState extends State<comandaPage> {
  @override
  Widget build(BuildContext context) {
    //inicializacion de las partes de la mesa
    Mesa mesa = ModalRoute.of(context)!.settings.arguments as Mesa;
    var codmesa = mesa.codMesa;
    return Scaffold(
      body: Column(
        children: [
          _banner(),
          _crearcomandas(codmesa.toString()),
          RaisedButton(
            disabledColor: Colors.blueAccent,
            child: Text("Añadir productos"),
            splashColor: Colors.blueAccent,
            color: Colors.amber,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => productoPage()),
              );
            },
          ),
          RaisedButton(
            disabledColor: Colors.blueAccent,
            child: Text("Cuenta"),
            splashColor: Colors.blueAccent,
            color: Colors.amber,
            onPressed: () {
              print("Enviamos cuenta");
            },
          ),
        ],
      ),
    );
  }

  Widget _banner() {
    return (const Image(
      image: AssetImage('assets/img/LogoApp.PNG'),
    ));
  }

  Widget _botonCuenta() {
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

  borrarlinea() {
    final barprovider = BarProvider();
  }

  Widget _crearcomandas(String codmesa) {
    final barprovider = BarProvider();

    return FutureBuilder(
        future: barprovider.getComanda(codmesa),
        builder: (BuildContext context, AsyncSnapshot<List<Comanda>> snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return comandas(snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget comandas(List<dynamic> comanda) {
    return Expanded(
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: comanda.length,
          itemBuilder: (BuildContext context, int index) {
            List<dynamic>? listccom = comanda[index].lineaComanda;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: listccom!.length,
                itemBuilder: (BuildContext context, int index2) {
                  dynamic producto = listccom[0].getproducto();
                  var nombre = "raul";
                  return Dismissible(
                    key: ValueKey(nombre + index2.toString()),
                    child: Card(
                      elevation: 3,
                      color: Colors.grey,
                      child: Text(
                        nombre,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    onDismissed: borrarlinea(),
                  );
                });
          }),
    );
  }
}
