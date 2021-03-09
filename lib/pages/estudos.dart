import 'package:app_igreja/pages/VerEstudo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EstudosPage extends StatefulWidget {
  @override
  _EstudosPageState createState() => _EstudosPageState();
}

class _EstudosPageState extends State<EstudosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Lista de Estudos"),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('estudo').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                child: Text("Nenhum estudo encontrado!"),
              );
            }

            return _listView(context, snapshot);
          }),
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
          var navigation = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerEstudo(
                  titulo: item['titulo'],
                  versiculo: item['versiculo'],
                  estudo: item['estudo'],
                ),
              ));
        },
        leading: IconButton(
          icon: Icon(Icons.book),
          onPressed: () {},
        ),
        title: Text(
          item['titulo'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item['versiculo'],
          overflow: TextOverflow.ellipsis,
        ),
      );
    },
  );
}
