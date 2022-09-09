import 'package:flutter/material.dart';
import 'package:qg/widgets/card-pedidos.dart';

import '../models/pedidos.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Pedido> pedidos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Color.fromARGB(255, 95, 95, 95),
                onPressed: () {
                  null;
                },
                icon: const Icon(Icons.account_circle_rounded),
                iconSize: 45,
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_active_rounded),
              tooltip: 'Notificações',
              onPressed: () {
                //coloca aqui a função
              },
              color: Color.fromARGB(255, 95, 95, 95),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              icon: const Icon(Icons.filter_list_rounded),
              tooltip: 'Filtro',
              onPressed: () {
                //coloca a função aqui
              },
              color: Color.fromARGB(255, 95, 95, 95),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
          backgroundColor: Color.fromARGB(255, 255, 251, 251),
        ),
        backgroundColor: Color(0xffEEEEEE),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Pedido pedido in pedidos)
                      CardPedido(pedido: pedido)
                  ],
                ),
              ),
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/realizarpedido');
          },
          backgroundColor: Color(0xff1FFFBF),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
