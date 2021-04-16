import 'package:app_igreja/model/PedidoModel.dart';
import 'package:app_igreja/service/PedidoService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  PedidoModel pedidoError = new PedidoModel();
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerPedido = TextEditingController();

  PedidoService pedidoService = new PedidoService();

  @override
  Widget build(BuildContext context) {
    return Consumer<PedidoService>(
      builder: (BuildContext context, value, Widget child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[800],
            title: Text("Lista de Pedidos"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showMyDialog(context, _controllerNome, _controllerPedido,
                  pedidoService, pedidoError);
            },
            child: Icon(Icons.add),
          ),
          body: StreamBuilder(
              stream: Firestore.instance.collection('pedido').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.data.documents.length == 0) {
                  return Center(
                    child: Text("Nenhum pedido encontrado!"),
                  );
                }

                return _listView(context, snapshot);
              }),
        );
      },
    );
  }
}

Widget _listView(BuildContext context, AsyncSnapshot snapshot) {
  return ListView.builder(
    itemCount: snapshot.data.documents.length,
    itemBuilder: (BuildContext context, int index) {
      var item = snapshot.data.documents[index];
      return ListTile(
        onTap: () async {
          // var navigation = await Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => VerMusica(
          //         titulo: item['titulo'],
          //         autor: item['autor'],
          //         letra: item['letra'],
          //       ),
          //     ));
        },
        leading: IconButton(
          icon: Icon(Icons.music_note),
          onPressed: () {},
        ),
        title: Text(
          'Pedido de ' + item['nome'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item['pedido'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    },
  );
}

Future<void> _showMyDialog(context, controllerNome, controllerPedido,
    PedidoService pedidoService, PedidoModel pedidoError) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return AlertDialog(
            title: Text('Pedido de Oração'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    controller: controllerNome,
                    decoration: InputDecoration(labelText: "Nome"),
                  ),
                  TextField(
                    controller: controllerPedido,
                    decoration: InputDecoration(labelText: "Pedido"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Enviar Pedido'),
                onPressed: () {
                  final String nome = controllerNome.text;

                  final String pedidoT = controllerPedido.text;
                  PedidoModel pedido =
                      new PedidoModel(nome: nome, pedido: pedidoT);
                  pedidoError = pedido;
                  if (nome != "" &&
                      nome != " " &&
                      pedidoT != "" &&
                      pedidoT != " ")
                    pedidoService.addPedido(pedido);
                  else {
                    setState(() {
                      pedidoService.setError(pedido,
                          "Por favor, insira o Pedido de oração e/ou seu nome.");
                    });

                    return;
                  }
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "${pedidoError.error}",
                style: TextStyle(color: Colors.red),
              ),
            ],
          );
        },
      );
    },
  );
}
