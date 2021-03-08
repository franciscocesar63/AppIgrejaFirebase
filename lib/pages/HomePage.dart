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
                icon: Icon(
                  Icons.library_music,
                  color: Colors.white,
                ),
                hoverColor: Colors.grey,
                iconSize: 55,
                onPressed: () {
                  print("Deu certo");
                }),
            Text(
              "Músicas",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ],
    ),
  );
}
