import 'package:appdambar/models/mesa_model.dart';
import 'package:appdambar/providers/bar_provider.dart';
import 'package:flutter/material.dart';

class mesasPage extends StatefulWidget {
  @override
  _mesasPageState createState() => _mesasPageState();
}

class _mesasPageState extends State<mesasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        children: [
          Column(
            children: [
              Image.asset('assets/img/LogoApp.PNG', fit: BoxFit.cover),
              Divider(),
              _crearInput(),
              _tarjetasmesas(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tarjetasmesas() {
    List<Mesa> mesas = [
      Mesa(1, false),
      Mesa(2, true),
      Mesa(3, true),
      Mesa(4, true),
    ];
    MaterialColor colorest = Colors.red;
    String codmesa = "";
    return Container(
      child: Column(
        children: [
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: mesas.length,
                itemBuilder: (BuildContext context, int index) {
                  final est = mesas[index].estado;
                  final cod = mesas[index].codMesa;
                  if (est != null) {
                    if (est) {
                      colorest = Colors.red;
                    } else {
                      colorest = Colors.green;
                    }
                  }
                  if (cod != null) {
                    codmesa = cod.toString();
                  }

                  return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 80,
                      child: Card(
                          elevation: 5,
                          color: colorest,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'comanda',
                                arguments: est),
                          )));
                }),
          ),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          hintText: 'Nº de la mesa',
          hintStyle: TextStyle(color: Colors.black),
          labelText: 'Numero mesa',
          labelStyle: TextStyle(color: Colors.black),
          suffixIcon: Icon(
            Icons.add,
            color: Colors.yellow.shade600,
          ),
          icon: Icon(Icons.tapas_outlined, color: Colors.yellow.shade600),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.yellow.shade600)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow.shade600)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow.shade600),
          )),
      onChanged:
          (valor) {}, /*onTap: () => Navigator.pushNamed(context, 'comanda')*/
    );
  }
}
