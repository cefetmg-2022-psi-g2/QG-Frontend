import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RealizarPedido extends StatelessWidget {
  const RealizarPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                SizedBox(height: 20,),
                Text(
                  "Fazer Pedido",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome do Item*",
                    hintText: "Ex.: Caneta",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Campus*",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Prédio*",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Complemento da Localização*",
                    hintText: "Ex.: Sala 205",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Categoria do Item*",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Observações",
                    hintText: "Ex.: A caneta tem que ser preta",
                  ),
                ),
                SizedBox(height: 30,),
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
                    SizedBox(height: 15,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff1FFFBF),
                      ),
                      onPressed: () {

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