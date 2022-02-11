import 'package:appdambar/pages/comanda_page.dart';
import 'package:appdambar/pages/mesas_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DamBar',
<<<<<<< Updated upstream
        initialRoute: 'comanda',
=======
        initialRoute: 'mesas',
>>>>>>> Stashed changes
        routes: {
          'mesas': (BuildContext context) => mesasPage(),
          'comanda': (BuildContext context) => comandaPage()
        });
  }
}