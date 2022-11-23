import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qg/widgets/card-pedidos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

import '../models/pedidos.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Pedido> pedidos = [];
  Map userData = {};
  String username = "Carregando";
  String score = "0.0";
  void loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (userData.isEmpty) {
      String? dataRaw = await prefs.getString('data');
      setState(() {
        userData = jsonDecode(dataRaw!);
      });
    }
  }

  Future<List<Pedido>> loadPedidos() async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    List<Pedido> pedidosAPI = [];
    String? userToken = await prefs.getString('userToken');

    Response response = await dio.get("http://164.92.92.152:3000/pedidos");
    response.data.forEach((pedido) async {
      //print(pedido["name"];
      Pedido p = Pedido(
          id: pedido['id'],
          item: pedido['name'],
          campus: pedido['campus'],
          predio: pedido['building_id'],
          complemento: pedido['localization'],
          categoria: pedido['category_id'],
          observacoes: pedido['description']);
      // Response responsePedido =
      //     await dio.get("http://164.92.92.152:3000/pedidos/${p.id}");
      // p.reqName = responsePedido.data["requester"]["username"];
      // p.score = responsePedido.data["requester"]["score"].toDouble();
      pedidosAPI.add(p);
    });
    return pedidosAPI;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadUserData();
      loadPedidos().then((val) => {
            setState(() {
              pedidos = val;
              username = userData["username"];
              score = userData["score"].toStringAsFixed(1);
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.all(12), children: <Widget>[
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
                          username,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          score,
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
                } /////// FUNÇÃO PARA IR PARA A TELA DE EDITAR DADOS /////////////
                ),
            const Divider(color: Colors.grey),
            // ListTile(
            //     title: Text("Amigos"),
            //     onTap: () {
            //       Navigator.pushNamed(context, '/amigos');
            //     } /////// FUNÇÃO PARA IR PARA A TELA DE AMIGOS /////////////
            //     ),
            // const Divider(color: Colors.grey),
            ListTile(
                title: Text(
                  "Desativar Conta",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap:
                    () {} /////// FUNÇÃO PARA IR PARA EXCLUIR CONTA /////////////
                )
          ]),
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
              onPressed: () {
                Navigator.pushNamed(context, '/abrirnotificacoes');
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
                  child: GridView.count(
                    padding: EdgeInsets.all(2),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1.5,
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
