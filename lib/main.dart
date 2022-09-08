import 'package:flutter/material.dart';
import 'package:qg/pages/qg_main_screen.dart';
import 'package:qg/pages/qg_realizar_pedido.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes: {
      '/realizarpedido': (context) => RealizarPedido(),
    },
    );
  }
}


