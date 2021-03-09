import 'package:app_igreja/pages/verCifra.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CifrasPage extends StatefulWidget {
  @override
  _CifrasPageState createState() => _CifrasPageState();
}

class _CifrasPageState extends State<CifrasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Lista de Cifras"),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('cifra').snapshots(),
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
                child: Text("Nenhuma cifra encontrada!"),
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
                builder: (context) => VerCifra(
                  titulo: item['titulo'],
                  autor: item['autor'],
                  letra: item['letra'],
                ),
              ));
        },
        leading: IconButton(
          icon: Icon(Icons.music_note),
          onPressed: () {},
        ),
        title: Text(
          item['titulo'],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item['autor'],
          overflow: TextOverflow.ellipsis,
        ),
      );
    },
  );
}
