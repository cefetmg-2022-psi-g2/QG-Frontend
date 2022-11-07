import 'package:flutter/material.dart';

class Amigos extends StatefulWidget {
  const Amigos({Key? key}) : super(key: key);

  @override
  State<Amigos> createState() => _AmigosState();
}

//**************************************************************************************************************
//**************************************************************************************************************
//AINDA TEM QUE CHAMAR OS AMIGOS, CRIAR UMA LIST ETC
//**************************************************************************************************************
//**************************************************************************************************************

class _AmigosState extends State<Amigos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        hintText: "Pesquisar Amigos",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Color(0xffC4C4C4),
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Adicionar Amigo",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "@Usuario",
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  //for (Pedido pedido in pedidos) CardPedido(pedido: pedido)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




