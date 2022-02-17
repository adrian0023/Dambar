import 'package:appdambar/pages/comanda_page.dart';
import 'package:appdambar/pages/mesas_page.dart';
import 'package:appdambar/pages/productos_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DamBar',
        initialRoute: 'productos',
        routes: {
          'mesas': (BuildContext context) => mesasPage(),
          'productos': (BuildContext context) => productoPage(),
          //'comanda': (BuildContext context) => comandaPage()
        });
  }
}
