import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/pedidos.dart';

class CardPedido extends StatelessWidget {
  CardPedido({Key? key, required this.pedido}) : super(key: key);

  final Pedido pedido;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
          onPressed: () {
            print("a");
          },
          child: Container(
            alignment: Alignment.centerLeft,
            width: 195,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffE7E7E7),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-6, 8),
                    spreadRadius: -11,
                    blurRadius: 14,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ]),
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 60,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Usuário",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xff1FFFBF),
                              size: 11,
                            ),
                            Text(
                              "4,5",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Carregador tipo C",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 8,
                    ),
                    Text(
                      "C2-P2 - Segundo Andar, sala 207",
                      style: TextStyle(
                        fontSize: 8,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
