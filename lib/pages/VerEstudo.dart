import 'package:flutter/material.dart';

class VerEstudo extends StatelessWidget {
  String titulo;
  String estudo;
  String versiculo;

  VerEstudo({this.titulo, this.estudo, this.versiculo});

  @override
  Widget build(BuildContext context) {
    final String estudoFinal = (this.estudo).replaceAll("*", "\n");
    final String tituloFinal = (this.titulo).replaceAll("*", "\n");
    final String versiculoFinal = (this.versiculo).replaceAll("*", "\n");

    print(estudoFinal);
    return Scaffold(
      appBar: AppBar(
        title: Text("Estudo"),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "\n$tituloFinal\n",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            Text(
              "$estudoFinal",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              "$versiculoFinal",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
