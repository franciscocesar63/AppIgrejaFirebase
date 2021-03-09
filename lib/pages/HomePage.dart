import 'package:app_igreja/pages/estudos.dart';
import 'package:flutter/material.dart';

import 'musicas.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/home.jpg"), fit: BoxFit.cover),
        ),
        child: _body(context),
      ),
    );
  }
}

_body(context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Image.asset("assets/musica1.jpg"),
                hoverColor: Colors.grey,
                iconSize: 55,
                splashRadius: 5,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MusicasPage()),
                  );
                }),
            Text(
              "Músicas",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
        Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Image.asset("assets/ensino.jpg"),
                hoverColor: Colors.grey,
                iconSize: 55,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EstudosPage()),
                  );
                }),
            Text(
              "Estudos",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
        Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Image.asset("assets/oracao.jpg"),
                hoverColor: Colors.grey,
                iconSize: 65,
                onPressed: () {
                  print("Deu certo");
                }),
            Text(
              "Pedidos",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ],
    ),
  );
}
