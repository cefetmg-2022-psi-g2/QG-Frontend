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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(12),
            children: <Widget> [
              Center(
                child: Column(
                  children: [
                    Center(
                      child: Icon(
                        Icons.account_circle_rounded, 
                        size: 200,
                      ),
                    ),
                    SizedBox(width: 40),
                    Container(
                      width: 220,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Nome do Usuário",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: 
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4,0",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(height: 8),
                            Icon(
                              Icons.star,
                              color: Color(0xff1FFFBF),
                            )
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text("Editar Dados"),
                onTap: () {
                  Navigator.pushNamed(context, '/editardados');
                }    /////// FUNÇÃO PARA IR PARA A TELA DE EDITAR DADOS /////////////
              ),
              const Divider(color: Colors.grey),
              ListTile(
                title: Text("Amigos"),
                onTap: () {
                  Navigator.pushNamed(context, '/amigos');
                }    /////// FUNÇÃO PARA IR PARA A TELA DE AMIGOS /////////////
              ),
              const Divider(color: Colors.grey),
              ListTile(
                title: Text(
                  "Desativar Conta",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () {}    /////// FUNÇÃO PARA IR PARA EXCLUIR CONTA /////////////
              )
            ]
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Color.fromARGB(255, 95, 95, 95),
                icon: const Icon(Icons.account_circle_rounded),
                iconSize: 45,
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_active_rounded),
              tooltip: 'Notificações',
<<<<<<< HEAD
              onPressed: () {},
=======
              onPressed: () {
                Navigator.pushNamed(context, '/abrirnotificacoes');
              },
>>>>>>> main
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
