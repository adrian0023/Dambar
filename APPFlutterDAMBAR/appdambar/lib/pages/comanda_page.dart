// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:appdambar/models/comanda_model.dart';
import 'package:appdambar/models/lineacomanda_model.dart';
import 'package:appdambar/models/mesa_model.dart';
import 'package:appdambar/models/producto_model.dart';
import 'package:appdambar/pages/productos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
/*
class comandaPage extends StatefulWidget {
  @override
  _comandaPageState createState() => _comandaPageState();
}

class _comandaPageState extends State<comandaPage> {
  @override
  Widget build(BuildContext context) {
    //inicializacion de las partes de la mesa
    Mesa mesa = ModalRoute.of(context)!.settings.arguments as Mesa;
    List<Comanda>? comanda = mesa.comandas;
    List<LineaComanda>? linCom = comanda![1].lineaComanda;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.amber[50],
        title: Image(
          image: AssetImage('assets/img/LogoApp.PNG'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              itemCount: linCom.length,
              itemBuilder: (context, index) {
                return Slidable(
                  key: ValueKey(index),
                  startActionPane: ActionPane(
                    dismissible: DismissiblePane(
                      onDismissed: () {},
                    ),
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        label: 'Eliminar',
                        icon: Icons.delete,
                        onPressed: (context) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Eliminado el producto ${linCom[index].producto}',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        linCom[index].producto,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
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
    return (Image(
      image: AssetImage('assets/img/LogoApp.PNG'),
    ));
  }

  Widget _numeroMesa() {
    return (Text('Mesa: ${comanda.codMesa}'));
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
*/