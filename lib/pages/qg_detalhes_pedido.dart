import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qg/widgets/card-pedidos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import '../models/pedidos.dart';

class DetalhesPedido extends StatefulWidget {
  const DetalhesPedido({Key? key}) : super(key: key);
  @override
  State<DetalhesPedido> createState() => _DetalhesPedido();
}

class _DetalhesPedido extends State<DetalhesPedido> {
  Pedido pedido = Pedido(
      id: 0,
      item: "",
      campus: 0,
      predio: 0,
      complemento: "",
      categoria: 0,
      observacoes: "");

  String campus = "";
  String requester = "";
  double score = 0;
  String textoPredio = "";
  String observacoes = "";

  Future<Pedido> loadPedido() async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    String? id = await prefs.getString('id');
    print(id);

    Response response = await dio.get("http://164.92.92.152:3000/pedidos/$id");
    Pedido p = Pedido(
        id: response.data['id'],
        item: response.data['name'],
        campus: response.data['campus'],
        predio: response.data['building_id'],
        complemento: response.data['localization'],
        categoria: response.data['category_id'],
        observacoes: response.data['description']);
    print(response);
    requester = response.data["requester"]["username"];
    score = response.data["requester"]["score"].toDouble();
    return p;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadPedido().then((val) => {
            setState(() {
              pedido = val;
              campus = pedido.campus.toString();
              observacoes = pedido.observacoes!;
              switch (pedido.predio) {
                case 97:
                  {
                    textoPredio = 'DECOM';
                    break;
                  }
                  ;
                case 98:
                  {
                    textoPredio = 'Prédio Principal';
                    break;
                  }
                  ;
                case 99:
                  {
                    textoPredio = 'Ar Livre';
                    break;
                  }
                  ;
                default:
                  {
                    textoPredio = 'P${pedido.predio}';
                    break;
                  }
              }
            })
          });
    });
  }

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

              // // Imagem vai até aqui
              // Divider(
              //   color: Colors.black,
              // ),

              // Espaço
              SizedBox(
                height: 10,
              ),

              // Aqui ficará o nome do Item
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    pedido.item,
                    style: TextStyle(
                      // Deixa em negrito
                      fontWeight: FontWeight.w800,

                      //Tamanho da letra
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  // CircleAvatar(
                  //   radius: 20,
                  //   backgroundColor: Colors.grey,
                  // ),
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
                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundColor: Colors.grey,
                  // ),

                  SizedBox(
                    width: 10,
                  ),

                  // Nome do usuário
                  Text(
                    "@$requester",
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
                    score.toStringAsFixed(1),
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
                          color: score > 0 ? Color(0xff1FFFBF) : Colors.grey,
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 10),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: score > 1 ? Color(0xff1FFFBF) : Colors.grey,
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 40),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: score > 2 ? Color(0xff1FFFBF) : Colors.grey,
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 65),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: score > 3 ? Color(0xff1FFFBF) : Colors.grey,
                          onPressed: () {},
                          padding: EdgeInsets.only(left: 90),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: const Icon(Icons.star),
                          color: score > 4 ? Color(0xff1FFFBF) : Colors.grey,
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
                    "Cefet Campus $campus",
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
                    textoPredio,
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
                    pedido.complemento,
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
                    observacoes,
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
                    onPressed: () async {
                      final dio = Dio();
                      final prefs = await SharedPreferences.getInstance();
                      String? userToken = await prefs.getString('userToken');

                      String id = pedido.id.toString();
                      print(userToken);
                      try {
                        Response response = await dio.post(
                            "http://164.92.92.152:3000/pedidos/attend/$id",
                            data: {"token": userToken});
                        if (response.statusCode == 200) {
                          Navigator.pushNamed(context, '/mainscreen');
                        }
                      } on DioError catch (e) {
                        print(e.response?.data);
                        switch (e.response?.statusCode) {
                          case 400:
                            const snackBar = SnackBar(
                                content: Text(
                                    "Erro. Recarregue e tente novamente."));
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            break;
                          case 409:
                            const snackBar = SnackBar(
                                content: Text(
                                    "Pedido não existe ou já foi atendido."));
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            break;
                          case 500:
                            const snackBar = SnackBar(
                                content: Text(
                                    "Erro do servidor. Por favor tente novamente mais tarde."));
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            break;
                          default:
                            const snackBar =
                                SnackBar(content: Text("Não autorizado."));
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            break;
                            break;
                        }
                      }
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
