import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qg/widgets/card-pedidos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import '../models/pedidos.dart';

class DetalhesPedido extends StatefulWidget {
  @override
  State<DetalhesPedido> createState() => _DetalhesPedido();
}

class _DetalhesPedido extends State<DetalhesPedido> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Cor de fundo
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        // Corpo da página
        body: Container(
          // Distância da ponta
          margin: EdgeInsets.all(15),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 1 Coluna
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextFormField(),

                      // Botão de voltar
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


                      
                    ],
                  ),

                  // 2 Coluna
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Color(0xff1FFFBF),
                        child: IconButton(
                          icon: const Icon(Icons.account_circle_rounded),
                          color: Colors.black,
                          iconSize: 100,
                          tooltip: 'Voltar para a lista de Pedidos',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          
                        ),
                      ),

                      TextFormField(),
                    ],
                  ),

                  // 3 Coluna
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Campus: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        "Prédio: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        "Complemento: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        "Observações: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 100,
                      ),

                    ],
                  ),

                  // 4 Coluna
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Botão de finalizar pedido
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff1FFFBF),
                        ),
                        onPressed: () => {},
                        child: const Text(
                          'Finalizar Pedido',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
