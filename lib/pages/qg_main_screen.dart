import 'dart:convert';

import 'package:dio/dio.dart';
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

  Future<List<Pedido>> loadPedidos() async {
    var dio = Dio();
    List<Pedido> pedidosAPI = [];
    Response response = await dio.get("http://10.0.2.2:3000/pedidos");
    response.data.forEach((pedido) {
      //print(pedido["name"];
      Pedido p = new Pedido(item: pedido['name'], campus: pedido['campus'], predio: pedido['building_id'], complemento: pedido['localization'], categoria: pedido['category_id'], observacoes: pedido['description']);
      pedidosAPI.add(p);
    });
    return pedidosAPI;
  }

  @override
  Widget build(BuildContext context) {
    loadPedidos().then((val) => {
          setState(() {
            pedidos = val;
          })
        });
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
              onPressed: () {},
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
                      for (Pedido pedido in pedidos) CardPedido(pedido: pedido)
                    ],
                  ),
                ),
              ],
            )),
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
