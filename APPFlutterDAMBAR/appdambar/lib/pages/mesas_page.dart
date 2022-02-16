import 'package:appdambar/providers/bar_provider.dart';
import 'package:flutter/material.dart';

class mesasPage extends StatefulWidget {
  @override
  _mesasPageState createState() => _mesasPageState();
}

class _mesasPageState extends State<mesasPage> {
  @override
  late List<dynamic> locmesas;
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
          _crearProductos()
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

  Widget _crearProductos() {
    final barprovider = BarProvider();

    return FutureBuilder(
        future: barprovider.getinfoProductoAgotado(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return _productosagotados(snapshot.data!);
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
    locmesas = mesas;
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
                  String cod = mesas[index].codMesa.toString();
                  if (est != null) {
                    if (est == "true") {
                      colorest = Colors.red;
                    }
                    if (est == "false") {
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
                              arguments: mesas[index]),
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

  Widget _productosagotados(List<dynamic> productos) {
    return Container(
      child: Column(
        children: [
          Text("Productos no disponibles",
              style: TextStyle(color: Colors.black, fontSize: 20)),
          Container(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productos.length,
                itemBuilder: (BuildContext context, int index) {
                  final nomprod = productos[index].nombre;
                  final imgprod = productos[index].foto;
                  return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 100,
                      child: Row(children: <Widget>[
                        Text(nomprod!,
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 10.0),
                              child: Divider(
                                color: Colors.white,
                                height: 10,
                              )),
                        ),
                        Image(
                          image: NetworkImage(imgprod),
                          alignment: Alignment.topRight,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 100,
                        ),
                      ]));
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
        onPressed: () => Navigator.pushNamed(context, 'comanda',
            arguments: locmesas[int.parse(mesa)]));
  }
}
