import 'package:flutter/material.dart';
import 'package:simple_html_css/simple_html_css.dart';

class VerEstudo extends StatelessWidget {
  String titulo;
  String estudo;
  String versiculo;

  VerEstudo({this.titulo, this.estudo, this.versiculo});

  @override
  Widget build(BuildContext context) {
    print(this.estudo);
    // or use HTML.toRichText()
    final TextSpan textSpan = HTML.toTextSpan(
      context,
      this.estudo,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Estudo"),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: RichText(text: textSpan),
        ),
      ),
    );
  }
}
