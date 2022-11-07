import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/amigos.dart';

class CardPedido extends StatelessWidget {
  CardPedido({Key? key, required this.amigos}) : super(key: key);

  final Amigos amigos;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff8F8B8B),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle_rounded,
                  size: 50,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  amigos.nome_amigo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                    iconSize: 40,
                    tooltip: 'Excluir Amigo',
                    onPressed: () {
                      null;
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
