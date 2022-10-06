import 'package:flutter/material.dart';
import 'package:qg/pages/qg_main_screen.dart';
import 'package:qg/pages/qg_realizar_pedido.dart';
import 'package:qg/pages/qg_primeiro_acesso.dart';
import 'package:qg/pages/qg_tela_login.dart';
import 'package:qg/pages/qg_tela_cadastro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeiroAcesso(),
      routes: {
      '/realizarpedido': (context) => RealizarPedido(),
      '/mainscreen': (context) => MainScreen(),
      '/primeiroacesso': (context) => PrimeiroAcesso(),
      '/realizarlogin':(context) => LoginUsuario(),
      '/realizarcadastro':(context) => CadastroUsuario(),
    },
    );
  }
}


