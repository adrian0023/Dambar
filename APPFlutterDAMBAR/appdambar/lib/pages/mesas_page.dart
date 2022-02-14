import 'package:appdambar/models/mesa_model.dart';
import 'package:appdambar/models/producto_model.dart';
import 'package:appdambar/providers/bar_provider.dart';
import 'package:flutter/material.dart';

class mesasPage extends StatefulWidget {
  @override
  _mesasPageState createState() => _mesasPageState();
}

class _mesasPageState extends State<mesasPage> {
  @override
  var mesa = "";
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        children: [
          Divider(),
          Column(
            children: [
              _banner(),
              Divider(),
              _crearInput(),
              _botonVerMesa(),
              _crearMesas(),
            ],
          ),
          Divider(),
          _productosagotados()
        ],
      ),
    );
  }

  Widget _crearMesas() {
    final barprovider = BarProvider();

    return FutureBuilder(
        future: barprovider.getinfoMesas(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return _tarjetasmesas(snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _tarjetasmesas(List<dynamic> mesas) {
    MaterialColor colorest = Colors.red;
    String codmesa = "";
    return Container(
      child: Column(
        children: [
          Container(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mesas.length,
                itemBuilder: (BuildContext context, int index) {
                  final est = mesas[index].estado.toString();
                  final cod = mesas[index].codMesa.toString();
                  print(est);
                  print(cod);
                  if (est != null) {
                    if (est == true) {
                      colorest = Colors.red;
                    }
                    if (est == false) {
                      colorest = Colors.green;
                    }
                  }

                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 60,
                    child: Card(
                        elevation: 0,
                        color: colorest,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, 'comanda',
                              arguments: codmesa),
                          child: Text(
                            "Mesa nº" + cod,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _productosagotados() {
    List<Producto> productos = [
      Producto(1, "plato de pasta", "httpgoogle.com/", "Pasta bolognesa1", 20.2,
          0, "Primer palto"),
      Producto(1, "plato de pasta", "httpgoogle.com/", "Pasta bolognesa2", 20.2,
          0, "Primer palto"),
      Producto(1, "plato de pasta", "httpgoogle.com/", "Pasta bolognesa3", 20.2,
          0, "Primer palto"),
      Producto(1, "plato de pasta", "httpgoogle.com/", "Pasta bolognesa4", 20.2,
          0, "Primer palto")
    ];
    return Container(
      child: Column(
        children: [
          Text("Productos no disponibles",
              style: TextStyle(color: Colors.black)),
          Container(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productos.length,
                itemBuilder: (BuildContext context, int index) {
                  final nomprod = productos[index].nombre;
                  return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 100,
                      child: Card(
                        elevation: 0,
                        color: Colors.blue,
                        child: Text(nomprod!,
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.left),
                      ));
                }),
          )
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
      onChanged: (valor) {
        setState(() {
          mesa = valor;
        });
      },
    );
  }

  Widget _banner() {
    return (Image(
      image: AssetImage('assets/img/LogoApp.PNG'),
    ));
  }

  Widget _botonVerMesa() {
    // ignore: deprecated_member_use
    return FlatButton(
        disabledColor: Colors.blueAccent,
        child: Text("Ver mesa"),
        splashColor: Colors.blueAccent,
        color: Colors.amber,
        onPressed: () => Navigator.pushNamed(context, 'comanda'));
  }
}
