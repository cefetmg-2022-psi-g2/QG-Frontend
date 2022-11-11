import 'package:flutter/material.dart';

class EditarDados extends StatefulWidget {

  @override
  State<EditarDados> createState() => _EditarDadosState();
}

class _EditarDadosState extends State<EditarDados> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            child: SingleChildScrollView(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
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
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Usuario*",
                    ),
                    validator: (text){
                      if(text != null && text.isEmpty) return "Usuario inválido!";
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text){
                      if(text != null &&(text.isEmpty || !text.contains("@"))) return "Email invállido!";
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Telefone",
                    ),
                    validator: (text){
                      if(text != null && text.isEmpty) return "Telefone inválido!";
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
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
      ),
    );
  }
}
