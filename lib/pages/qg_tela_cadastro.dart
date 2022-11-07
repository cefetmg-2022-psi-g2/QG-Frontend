import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastroUsuario extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey();
  bool _validate = false;

  String sexoValue = 'Masculino';
  String senha = ''; 

  @override
  Widget build(BuildContext context) {
    
 
  



    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
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
                  "Cadastrar",
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
                    hintText: "Ex.: Usuario12",
                  ),
                  validator: (text){
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email*",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text){
                    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = new RegExp(pattern);
                    if (text == null || text.length == 0) {
                      return "Informe o Email";
                    } else if(!regExp.hasMatch(text)){
                      return "Email inválido";
                    }
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Data de Nascimento*",
                  ),
                  validator: (text){
                    if(text == null ||(text.isEmpty)) return "Data inválida!";
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Telefone*",
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (text){
                    String patttern = r'(^[0-9]*$)';
                    RegExp regExp = new RegExp(patttern);
                    if (text == null ||(text.isEmpty)) {
                      return "Informe o celular";
                    } else if(text.length != 11){
                      return "O celular deve ter DDD e o dígito 9";
                    }else if (!regExp.hasMatch(text)) {
                      return "O número do celular so deve conter dígitos";
                    }
                  },
                ),
                SizedBox(height: 8),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Sexo",
                  ), items:  <String>['Masculino', 'Feminino', 'Outros'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(), 
                  onChanged: (String? newValue) {     
                    sexoValue = newValue!;  
                  }
                ),
                SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha*',
                  ),
                  validator: (text){
                    if(text == null ||(text.isEmpty || text.length < 6)) return "Senha inválida!";
                    else senha = text;                
                  }
                ),
                SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirmação da Senha*',
                  ),
                  validator: (text){
                    if(text == null ||(text.isEmpty || text.length < 6)) return "Senha inválida!";
                    else if(text != senha) return "Senhas não coincedem";
                  }
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
                      onPressed: (){ 
                        print(_formKey);
                        if(_formKey.currentState!.validate()){
                          
                        }
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
    );
  }
}