import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/pedidos.dart';

class CardPedido extends StatelessWidget {
  CardPedido({Key? key, required this.pedido}) : super(key: key);

  final Pedido pedido;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.account_circle_rounded,
            size: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            pedido.item,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Campus - ${pedido.campus.toString()}",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Prédio - ${pedido.predio}",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Complemento - ${pedido.complemento}",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Atender Pedido"),
          ),
        ],
      ),
    );
  }
}
