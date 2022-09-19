import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PrimeiroAcesso extends StatelessWidget {
  const PrimeiroAcesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 320, 
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border : Border.all(width: 3.0, color: Colors.black),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/imagens/quebraGalho.jpg'),
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: Text('Quebra Galho', style: TextStyle(
            fontSize: 50, 
            color: Colors.black,
              ), 
            ), 
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/realizarlogin');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(200,50),
                  primary: Colors.white,
                  

                ),
                child: Text('Login' , 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                )
              ), 
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/realizarcadastro');
                },
                 style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF1FFFBF),
                  fixedSize: const Size(200,50),
                  primary: Colors.black,
                  
                ),
                child: Text('Cadastro', 
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )
                ), 
              )
            ],
            ),
        ],
      )
      )
     );
  }
}