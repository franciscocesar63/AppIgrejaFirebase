import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class VerEstudo extends StatelessWidget {
  String titulo;
  String estudo;
  String versiculo;

  VerEstudo({this.titulo, this.estudo, this.versiculo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estudo"),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Html(
            data: this.estudo,
            padding: EdgeInsets.all(8.0),
            onLinkTap: (url) {
              print("Opening $url...");
            },
            customRender: (node, children) {
              if (node is dom.Element) {
                switch (node.localName) {
                  case "custom_tag": // using this, you can handle custom tags in your HTML
                    return Column(children: children);
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
