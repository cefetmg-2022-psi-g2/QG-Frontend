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
        // Cor de Fundo
        backgroundColor: Color.fromARGB(255, 255, 251, 251),

        // Corpo da página
        body: Container(

          // Espaço ao redor
          margin: EdgeInsets.all(20),

          child: Column(
            // Deixa a seta na esquerda da tela
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // CircleAvater é a seta
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

              // Espaço
              SizedBox(
                height: 40,
              ),

              // Imagem vai até aqui
              Divider(
                color: Colors.black,
              ),

              // Espaço
              SizedBox(height: 10,),

              // Aqui ficará o nome do Item
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Carregador",
                    style: TextStyle(
                      // Deixa em negrito
                      fontWeight: FontWeight.w800,

                      //Tamanho da letra
                      fontSize: 40,

                    ),
                  ),

                  SizedBox(width: 100,),

                  CircleAvatar(
                   radius: 20,
                   backgroundColor: Colors.grey,
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Divider(),

              SizedBox(
                height: 10,
              ),

              // Aqui ficará a avaliação
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  // Nome do usuário
                  Text(
                    "@Markkin",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),

                  // Nota
                  Text(
                    "4.0",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  // color: Color(0xff1FFFBF),
                  // Estrelas
                  Stack(
                    children: [
                      Container(
                        
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: Color(0xff1FFFBF),
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 10),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: Color(0xff1FFFBF),
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 40),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: Color(0xff1FFFBF),
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 65),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: Color(0xff1FFFBF),
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 90),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: Colors.grey,
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 115),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              

              SizedBox(
                height: 10,
              ),

              Divider(),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Campus: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Cefet Campus I",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Divider(
                indent: 10,
                endIndent: 10,
              ),
              Row(
                children: [
                  Text(
                    "Prédio: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Principal",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Divider(
                indent: 10,
                endIndent: 10,
              ),
              Row(
                children: [
                  Text(
                    "Complemento: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Corredor Terceiro Andar",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Divider(
                indent: 10,
                endIndent: 10,
              ),
              Row(
                children: [
                  Text(
                    "Observações: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Do tipo C por favor",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 240,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1FFFBF),
                    ),
                    onPressed: () {
                      
                    },
                    child: const Text(
                      'Atender Pedido',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
