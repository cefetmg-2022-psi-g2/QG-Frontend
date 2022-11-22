import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'dart:convert';
import '../models/usuario.dart';
import 'package:intl/intl.dart';

class CadastroUsuario extends StatefulWidget {
  CadastroUsuario({Key? key}) : super(key: key);

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final GlobalKey<FormState> _formKey = new GlobalKey();

  bool _validate = false;

  String sexoValue = 'M';

  String senha = '';
  

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerBirth = TextEditingController();
    final TextEditingController controllerPhone = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    final TextEditingController controllerPassword2 = TextEditingController();

    
    
    void initState() {
        controllerBirth.text = ""; //set the initial value of text field
        super.initState();
      }
    void login(String username, String password, BuildContext context) async {
      var dio = Dio();
      try {
        Response response = await dio.post("http://164.92.92.152:4000/auth/login",
            data: {'username': username, 'password': password});
        if (response.statusCode == 200) {
          String token = response.data['token'];
          try {
            Response userValidated = await dio.post(
                "http://164.92.92.152:4000/auth/validate",
                data: {'token': token});
            if (userValidated.statusCode == 200) {
              //passou nas 2 verificações
              final prefs = await SharedPreferences.getInstance();
              userValidated.data = userValidated.data['data'];
              Usuario user = Usuario(
                  usuario: userValidated.data['username'],
                  email: userValidated.data['email'],
                  dataNascimento: userValidated.data['date_birth'],
                  telefone: userValidated.data['phone'],
                  confirmacaoSenha: 'não');
              prefs.setString("data", jsonEncode(user));
              prefs.setString("userToken", token);
              Navigator.pushNamed(context, '/mainscreen');
            }
          } on DioError catch (e) {
            print(e);
          }
        }
      } on DioError catch (e) {
        switch (e.response?.statusCode) {
          case 400:
            break;
          case 401:
            break;
          case 500:
            break;
          default:
            break;
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
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
                        "Cadastrar",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: controllerName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Usuario*",
                          hintText: "Ex.: Usuario12",
                        ),
                        validator: (text) {
                          String patttern = r'[a-zA-Z][a-zA-Z0-9-_]';
                          RegExp regExp = new RegExp(patttern);
                          if (text == null || text.length == 0) {
                            return "Informe o nome";
                          } else if (!regExp.hasMatch(text)) {
                            return "Insira caracteres válidos";
                          }
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: controllerEmail,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email*",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = new RegExp(pattern);
                          if (text == null || text.length == 0) {
                            return "Informe o Email";
                          } else if (!regExp.hasMatch(text)) {
                            return "Email inválido";
                          }
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: controllerBirth, 
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Data Nascimento"
                            ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );

                          if (pickedDate != null) {
                            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

                            controllerBirth.text = formattedDate; 
                          } else {
                            print("Data não foi selecionada");
                          }
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: controllerPhone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Telefone*",
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (text) {
                          String patttern = r'(^[0-9]*$)';
                          RegExp regExp = new RegExp(patttern);
                          if (text == null || (text.isEmpty)) {
                            return "Informe o celular";
                          } else if (text.length != 11) {
                            return "O celular deve ter DDD e o dígito 9";
                          } else if (!regExp.hasMatch(text)) {
                            return "O número do celular so deve conter dígitos";
                          }
                        },
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Sexo",
                          ),
                          items: [DropdownMenuItem(child: Text("Masculino"), value: 'M',),
                          DropdownMenuItem(child: Text("Feminino"), value: 'F',),
                          DropdownMenuItem(child: Text("Outros"), value: 'O',),],
                          onChanged: (String? newValue) {
                            sexoValue = newValue!;
                          }),
                      SizedBox(height: 8),
                      TextFormField(
                          controller: controllerPassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Senha*',
                          ),
                          validator: (text) {
                            if (text == null ||
                                (text.isEmpty || text.length < 6))
                              return "Senha inválida!";
                            else
                              senha = text;
                          }),
                      SizedBox(height: 8),
                      TextFormField(
                          controller: controllerPassword2,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirmação da Senha*',
                          ),
                          validator: (text) {
                            if (text == null ||
                                (text.isEmpty || text.length < 6))
                              return "Senha inválida!";
                            else if (text != senha)
                              return "Senhas não coincedem";
                          }),
                      SizedBox(
                        height: 30,
                      ),
                    ],
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
                          if (_formKey.currentState!.validate()) {
                            var dio = Dio();

                            if (controllerName.text.isEmpty &&
                                controllerBirth.text.isEmpty &&
                                controllerEmail.text.isEmpty &&
                                controllerPhone.text.isEmpty &&
                                controllerPassword.text.isEmpty &&
                                controllerPassword2.text.isEmpty) {
                              return;
                              
                            }
                            if (controllerPassword.text !=
                                controllerPassword2.text) {
                              const snackBar = SnackBar(
                                  content: Text("As senhas devem ser iguais."));
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                            try {
                              Response response = await dio.post(
                                  "http://164.92.92.152:4000/auth/signup",
                                  data: {
                                    'name': controllerName.text,
                                    'username': controllerName.text,
                                    'password': controllerPassword.text,
                                    'email': controllerEmail.text,
                                    'dateBirth': controllerBirth.text,
                                    'phone': controllerPhone.text,
                                    'gender': sexoValue
                                  });
                              if (response.statusCode == 200) {
                                // ignore: use_build_context_synchronously
                                login(controllerName.text,
                                    controllerPassword.text, context);
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
                            on Error catch(e){
                              print(e);
                            }
                          }
                          ;
                        },
                        child: const Text(
                          'Realizar Cadastro',
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
