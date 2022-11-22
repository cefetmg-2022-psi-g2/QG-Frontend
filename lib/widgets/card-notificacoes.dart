import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/pedidos.dart';
import '../models/usuario.dart';

class CardNotificacao extends StatelessWidget {
  CardNotificacao(
      {Key? key,
      required this.pedido,
      required this.requester,
      required this.supplier})
      : super(key: key);

  final Usuario requester;
  final Usuario supplier;
  final Pedido pedido;

  @override
  Widget build(BuildContext context) {
    String textoPredio;
    switch(pedido.predio){
      case 97: {
        textoPredio = 'DECOM';
        break;
      };
      case 98: {
        textoPredio = 'Prédio Principal';
        break;
      };
      case 99: {
        textoPredio = 'Ar Livre';
        break;
      };
      default: {
        textoPredio = 'P${pedido.predio}';
        break;
      }
    }
    return Column(
      children: [
        FlatButton(
          onPressed: () {
            print("a");
          },
          child: Container(
            height: 150,
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
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                "${requester.usuario}",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xff1FFFBF),
                                    size: 11,
                                  ),
                                  Text(
                                    "5,0",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                "${supplier.usuario}",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xff1FFFBF),
                                    size: 11,
                                  ),
                                  Text(
                                    "5,0",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  VerticalDivider(
                    indent: 8,
                    endIndent: 8,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Column(
                    children: [
                      Text(
                        "${pedido.item}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 11,
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            "C${pedido.campus}-${textoPredio} - ${pedido.complemento}",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
