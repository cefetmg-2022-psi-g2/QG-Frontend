import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qg/widgets/card-pedidos.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

import '../models/pedidos.dart';

class Notificacoes extends StatefulWidget {
  const Notificacoes({Key? key}) : super(key: key);
  @override
  State<Notificacoes> createState() => AbrirNotificacoes();
}

class AbrirNotificacoes extends State<Notificacoes> {
  List<Pedido> pedidosAtivos = [];
  Future<List<Pedido>> loadPedidos() async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    List<Pedido> pedidosAPI = [];
    String? userToken = await prefs.getString('userToken');
    print(userToken);

    Response response = await dio
        .get("http://164.92.92.152:3000/pedidos/active?token=$userToken");
    response.data.forEach((pedido) {
      Pedido p = Pedido(
          id: pedido['id'],
          item: pedido['name'],
          campus: pedido['campus'],
          predio: pedido['building_id'],
          complemento: pedido['localization'],
          categoria: pedido['category_id'],
          observacoes: pedido['description']);
      pedidosAPI.add(p);
    });
    return pedidosAPI;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadPedidos().then((val) => {
            setState(() {
              pedidosAtivos = val;
            })
          });
    });
  }

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
                  SizedBox(
                    height: 20,
                  ),
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
                              onTap: () {} /////// Função apra ir para o pedido
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
