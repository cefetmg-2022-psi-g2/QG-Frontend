import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

class RealizarPedido extends StatelessWidget {
  RealizarPedido({Key? key}) : super(key: key);

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCampus = TextEditingController();
  final TextEditingController controllerBuilding = TextEditingController();
  final TextEditingController controllerPlace = TextEditingController();
  final TextEditingController controllerCategory = TextEditingController();
  final TextEditingController controllerObs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Padding(
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
                  "Fazer Pedido",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: controllerName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome do Item*",
                    hintText: "Ex.: Caneta",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: controllerCampus,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Campus*",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: controllerBuilding,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Prédio*",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: controllerPlace,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Complemento da Localização*",
                    hintText: "Ex.: Sala 205",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: controllerCategory,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Categoria do Item*",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: controllerObs,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Observações",
                    hintText: "Ex.: A caneta tem que ser preta",
                  ),
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
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
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
                        var dio = Dio();
                        if (controllerBuilding.text.isEmpty &&
                            controllerCampus.text.isEmpty &&
                            controllerCategory.text.isEmpty &&
                            controllerName.text.isEmpty &&
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
                          Response response = await dio
                              .post("http://10.0.2.2:3000/pedidos", data: {
                            'token': userToken,
                            'name': controllerName.text,
                            'category_id': controllerCategory.text,
                            'building_id': controllerBuilding.text,
                            'description': controllerObs.text,
                            'localization': controllerPlace.text,
                            'campus': controllerCampus.text
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
                                  content:
                                      Text("Dados invalidos ou incorretos."));
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
                              break;
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
    );
  }
}
