import 'package:cloud_firestore/cloud_firestore.dart';

class PedidoModel {
  String nome;
  String pedido;
  Timestamp data;
  String id;
  String error = "";

  PedidoModel({this.nome, this.pedido});
}
