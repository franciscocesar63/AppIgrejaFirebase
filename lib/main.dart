import 'package:app_igreja/pages/HomePage.dart';
import 'package:app_igreja/pages/SplashPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firestore.instance.collection('estudo').getDocuments().then((value) {
      value.documents.forEach((element) {
        print(element.data);
      });
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pequenos Grupos - IBR Fé',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageSplash(),
    );
  }
}
