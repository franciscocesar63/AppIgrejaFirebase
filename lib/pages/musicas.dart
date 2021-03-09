import 'package:app_igreja/pages/verMusica.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MusicasPage extends StatefulWidget {
  @override
  _MusicasPageState createState() => _MusicasPageState();
}

class _MusicasPageState extends State<MusicasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Lista de Músicas"),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('musica').snapshots(),
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
                child: Text("Nenhuma música encontrada!"),
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
                builder: (context) => VerMusica(
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
