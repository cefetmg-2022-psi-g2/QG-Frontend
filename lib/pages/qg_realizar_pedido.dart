import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

class RealizarPedido extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey();
  RealizarPedido({Key? key}) : super(key: key);
  bool _validate = false;
  String campusValue = '1';
  String categoriaValue = '1';
  String predioValue = '1';

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPlace = TextEditingController();
  final TextEditingController controllerObs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
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
                        "Fazer Pedido",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: controllerName,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Nome do Item*",
                              hintText: "Ex.: Caneta",
                            ),
                            validator: (text) {
                              String patttern = r'[a-zA-Z][a-zA-Z0-9-_]';
                              RegExp regExp = new RegExp(patttern);
                              if (text == null || text.length == 0) {
                                return "Informe um nome para o pedido";
                              } else if (!regExp.hasMatch(text)) {
                                return "Insira caracteres válidos";
                              }
                            },
                          ),
                          SizedBox(height: 8),
                          DropdownButtonFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Campus",
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text("1"),
                                  value: '1',
                                ),
                                DropdownMenuItem(
                                  child: Text("2"),
                                  value: '2',
                                ),
                              ],
                              onChanged: (String? newValue) {
                                campusValue = newValue!;
                              }),
                          SizedBox(height: 8),
                          DropdownButtonFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Prédio",
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Ar Livre"),
                                  value: '99',
                                ),
                                DropdownMenuItem(
                                  child: Text("Prédio Principal"),
                                  value: '98',
                                ),
                                DropdownMenuItem(
                                  child: Text("Prédio 20"),
                                  value: '20',
                                ),
                                DropdownMenuItem(
                                  child: Text("Prédio 12"),
                                  value: '12',
                                ),
                                DropdownMenuItem(
                                  child: Text("Prédio 19"),
                                  value: '19',
                                ),
                              ],
                              onChanged: (String? newValue) {
                                predioValue = newValue!;
                              }),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: controllerPlace,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Complemento da Localização*",
                              hintText: "Ex.: Sala 205",
                            ),
                            validator: (text) {
                              String patttern = r'[a-zA-Z][a-zA-Z0-9]';
                              RegExp regExp = new RegExp(patttern);
                              if (text == null || text.length == 0) {
                                return "Informe um complemento para o pedido";
                              } else if (!regExp.hasMatch(text)) {
                                return "Insira caracteres válidos";
                              }
                            },
                          ),
                          SizedBox(height: 8),
                          DropdownButtonFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Categoria",
                              ),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Eletrônico"),
                                  value: '1',
                                ),
                                DropdownMenuItem(
                                  child: Text("Material"),
                                  value: '2',
                                ),
                              ],
                              onChanged: (String? newValue) {
                                categoriaValue = newValue!;
                              }),
                          SizedBox(height: 8),
                          TextFormField(
                            controller: controllerObs,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Observações",
                              hintText: "Ex.: A caneta tem que ser preta",
                            ),
                            validator: (text) {
                              String patttern = r'[a-zA-Z][a-zA-Z0-9]';
                              RegExp regExp = new RegExp(patttern);
                              if (text == null || text.length == 0) {
                                return "Informe uma descrição para o pedido";
                              } else if (!regExp.hasMatch(text)) {
                                return "Insira caracteres válidos";
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Os campos com * são obrigatórios!",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff1FFFBF),
                        ),
                        onPressed: () async {
                          print(controllerName.text);
                          print(categoriaValue);
                          print(predioValue);
                          print(campusValue);
                          if (_formKey.currentState!.validate()) {
                            var dio = Dio();
                            if (controllerName.text.isEmpty &&
                                controllerPlace.text.isEmpty) {
                              return;
                            }
                            final prefs = await SharedPreferences.getInstance();
                            String? userToken = prefs.getString('userToken');
                            if (userToken != null && userToken.isEmpty ||
                                userToken == null) {
                              return;
                            }

                            try {
                              Response response = await dio.post(
                                  "http://164.92.92.152:3000/pedidos",
                                  data: {
                                    'token': userToken,
                                    'name': controllerName.text,
                                    'category_id': categoriaValue,
                                    'building_id': predioValue,
                                    'description': controllerObs.text,
                                    'localization': controllerPlace.text,
                                    'campus': campusValue
                                  });
                              if (response.statusCode == 200) {
                                const snackBar = SnackBar(
                                    content:
                                        Text("Pedido adicionado com sucesso!"));
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.pushNamed(context, '/mainscreen');
                              }
                            } on DioError catch (e) {
                              switch (e.response?.statusCode) {
                                case 400:
                                  const snackBar = SnackBar(
                                      content: Text(
                                          "Dados invalidos ou incorretos."));
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  break;
                                case 500:
                                  const snackBar = SnackBar(
                                      content: Text(
                                          "Erro do servidor. Por favor tente novamente mais tarde."));
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  break;
                                default:
                                  break;
                              }
                            }
                          }
                        },
                        child: const Text(
                          'Fazer Pedido',
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
        ),
      ),
    );
  }
}
