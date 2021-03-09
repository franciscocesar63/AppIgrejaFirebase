import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/home.jpg"), fit: BoxFit.cover),
        ),
        child: _body(),
      ),
    );
  }
}

_body() {
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
                  print("Deu certo");
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
                  print("Deu certo");
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
