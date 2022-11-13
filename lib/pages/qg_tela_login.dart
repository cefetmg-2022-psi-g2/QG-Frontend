import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'dart:convert';
import '../models/usuario.dart';

class LoginUsuario extends StatelessWidget {
  LoginUsuario({Key? key}) : super(key: key);
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
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
                          tooltip: 'Voltar para a tela principal',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username",
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty)
                            return "Nome inválido!";
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Senha*',
                          ),
                          validator: (text) {
                            if (text == null ||
                                (text.isEmpty || text.length < 6))
                              return "Senha inválida!";
                          }),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff1FFFBF),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var dio = Dio();
                            try {
                              Response response = await dio.post(
                                  "http://10.0.2.2:4000/auth/login",
                                  data: {
                                    'username': usernameController.text,
                                    'password': passwordController.text
                                  });
                              if (response.statusCode == 200) {
                                String token = response.data['token'];
                                try {
                                  Response userValidated = await dio.post(
                                      "http://10.0.2.2:4000/auth/validate",
                                      data: {'token': token});
                                  if (userValidated.statusCode == 200) {
                                    //passou nas 2 verificações
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    userValidated.data =
                                        userValidated.data['data'];
                                    Usuario user = Usuario(
                                        usuario:
                                            userValidated.data['username'],
                                        email: userValidated.data['email'],
                                        dataNascimento:
                                            userValidated.data['date_birth'],
                                        telefone: userValidated.data['phone'],
                                        confirmacaoSenha: 'não');
                                    prefs.setString("data", jsonEncode(user));
                                    prefs.setString("userToken", token);
                                    Navigator.pushNamed(
                                        context, '/mainscreen');
                                  }
                                } on DioError catch (e) {
                                  print(e);
                                  const snackBar = SnackBar(
                                      content:
                                          Text("Erro interno do gateway"));
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            } on DioError catch (e) {
                              switch (e.response?.statusCode) {
                                case 400:
                                  passwordController.clear();
                                  usernameController.clear();
                                  const snackBar = SnackBar(
                                      content: Text(
                                          "Dados invalidos ou incorretos."));
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  break;
                                case 401:
                                  passwordController.clear();
                                  usernameController.clear();
                                  const snackBar = SnackBar(
                                      content: Text(
                                          "Usuário e/ou senha incorretos."));
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  break;
                                case 500:
                                  passwordController.clear();
                                  usernameController.clear();
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
                            ;
                          }
                        },
                        child: const Text(
                          'Realizar Login',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Esqueci Minha Senha",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
