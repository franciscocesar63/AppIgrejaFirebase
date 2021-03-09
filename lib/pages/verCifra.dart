import 'package:flutter/material.dart';

class VerCifra extends StatelessWidget {
  String titulo;
  String autor;
  String letra;

  VerCifra({this.titulo, this.autor, this.letra});

  @override
  Widget build(BuildContext context) {
    final String letraFinal = (this.letra).replaceAll("*", "\n");

    print(letraFinal);
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.titulo}"),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "\n${this.titulo}\n",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                "$letraFinal",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
