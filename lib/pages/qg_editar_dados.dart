import 'package:flutter/material.dart';

class EditarDados extends StatefulWidget {
  const EditarDados({super.key});

  @override
  State<EditarDados> createState() => _EditarDadosState();
}

class _EditarDadosState extends State<EditarDados> {
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
                    tooltip: 'Voltar para a tela principal',
                    onPressed: () {
                     Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Editar dados",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Usuario*",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Telefone",
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Sexo",
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
                        'Salvar Alterações',
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
