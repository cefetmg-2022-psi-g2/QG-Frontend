import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qg/widgets/card-pedidos.dart';

import '../models/pedidos.dart';

class AbrirNotificacoes extends StatelessWidget {
  AbrirNotificacoes({Key? key}) : super(key: key);
  
   List<Pedido> pedidosAtivos = [];
   List<Pedido> pedidosAmizades = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
     backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff1FFFBF),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.black,
                      iconSize: 30,
                      tooltip: 'Voltar para a lista de Pedidos',
                      onPressed: () {
                       Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Notificações",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Divider(color: Colors.grey),
                  Text(
                    "Pedidos Ativos",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Pedido pedido in pedidosAtivos)
                        ListTile(
                          title: Text(""),
                          onTap: () {}    /////// Função apra ir para o pedido
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 200),
                const Divider(color: Colors.grey),
                Text(
                    "Pedidos de amizade",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Pedido pedido in pedidosAmizades)
                        ListTile(
                          title: Text(""),
                          onTap: () {}    /////// Função apra ir para o pedido
                        ),
                    ],
                  ),
                ),
                ],
            ),
          ),
       
    ),
        ),
    ),
    );
  }
}