import 'package:app_igreja/model/PedidoModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class PedidoService extends ChangeNotifier {
  Firestore firestore = Firestore.instance;

  addPedido(PedidoModel pedido) async {
    await firestore.collection("pedido").add({
      "nome": pedido.nome,
      "pedido": pedido.pedido,
      "data": DateTime.now().microsecondsSinceEpoch
    }).then((value) {
      pedido.id = value.documentID;
    });
    notifyListeners();
  }

  setError(PedidoModel pedidoModel, String error) {
    pedidoModel.error = error;
    notifyListeners();
  }
}
