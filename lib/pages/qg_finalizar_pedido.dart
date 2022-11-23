import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'package:qg/models/pedidos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'dart:convert';
import '../models/usuario.dart';
import 'package:url_launcher/url_launcher.dart';

class FinalizarPedido extends StatefulWidget {
  const FinalizarPedido({Key? key}) : super(key: key);
  @override
  State<FinalizarPedido> createState() => AbrirFinalizarPedido();
}

class AbrirFinalizarPedido extends State<FinalizarPedido> {
  Pedido pedido = Pedido(
      id: 0,
      item: "",
      campus: 0,
      predio: 0,
      complemento: "",
      categoria: 0,
      observacoes: "");
  String textoPredio = "";
  String campus = "";
  String requester = "";
  double score = 0;
  String observacoes = "";

  Future<Pedido> loadPedido() async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    String? id = await prefs.getString('id');
    Response response = await dio.get("http://10.0.2.2:3000/pedidos/$id");
    Pedido p = Pedido(
        id: response.data['id'],
        item: response.data['name'],
        campus: response.data['campus'],
        predio: response.data['building_id'],
        complemento: response.data['localization'],
        categoria: response.data['category_id'],
        observacoes: response.data['description']);
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

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsPadding: EdgeInsets.all(10),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Avaliação',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Avalie sua experiência com este usuário:',
                    style: const TextStyle(fontWeight: FontWeight.w100),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up_sharp,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/mainscreen');
                    },
                    iconSize: 40,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down_sharp,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/mainscreen');
                    },
                    iconSize: 40,
                  ),
                ],
              ),
              MaterialButton(
                elevation: 5.0,
                child: Text('Pular'),
                onPressed: () {
                  Navigator.pushNamed(context, '/mainscreen');
                },
              )
            ],
          );
        });
  }

  abrirUrl() async {
    final url = Uri.parse(
        'https://wa.me/${5531982540977}?text= Olá, vim pelo Quebra Galho');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  fazerLigacao() async {
    final url = Uri.parse('tel:+55 31 982540977');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        size: 210,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Image.asset('assets/imagens/logoWp.png'),
                            iconSize: 40,
                            onPressed: abrirUrl,
                            tooltip: "Acessa o Whatsapp do Usuário",
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 1,
                            height: 35,
                            child: const DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.phone,
                            ),
                            onPressed: fazerLigacao,
                            tooltip: "Liga para o Usuário",
                            iconSize: 40,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Campus: ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                      fontWeight: FontWeight.w600,
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
                      fontWeight: FontWeight.w600,
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
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1FFFBF),
                    ),
                    onPressed: () {
                      createAlertDialog(context).then((onValue) {});
                    },
                    child: const Text(
                      'Finalizar Pedido',
                      style: TextStyle(
                        color: Colors.black,
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
