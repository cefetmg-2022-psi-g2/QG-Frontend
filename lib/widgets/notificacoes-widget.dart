import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/pedidos.dart';
import '../models/usuario.dart';

class CardPedido extends StatelessWidget {
  CardPedido({Key? key, required this.pedido, required this.usuario})
      : super(key: key);

  final Pedido pedido;
  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    String textoPredio;
    switch (pedido.predio) {
      case 97:
        {
          textoPredio = 'DECOM';
          break;
        }
        ;
      case 98:
        {
          textoPredio = 'Prédio Principal';
          break;
        }
        ;
      case 99:
        {
          textoPredio = 'Ar Livre';
          break;
        }
        ;
      default:
        {
          textoPredio = 'P${pedido.predio}';
          break;
        }
    }
    return Column(
      children: [
        ElevatedButton(
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
                          "${usuario.usuario}",
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
                              "5",
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
                  "${pedido.item}",
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
                      "C${pedido.campus}-${textoPredio} - ${pedido.complemento}",
                      //97 - DECOM
                      //98 - Prédio Principal
                      //99 - Ar Livre
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
