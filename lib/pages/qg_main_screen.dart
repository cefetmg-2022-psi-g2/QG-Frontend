import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Color.fromARGB(255, 95, 95, 95),
              onPressed: () {
                null;
              },
              icon: const Icon(Icons.account_circle_rounded),
              iconSize: 45,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_active_rounded),
            tooltip: 'Notificações',
            onPressed: () {
              //coloca aqui a função
            },
            color: Color.fromARGB(255, 95, 95, 95),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            tooltip: 'Filtro',
            onPressed: () {
              //coloca a função aqui
            },
            color: Color.fromARGB(255, 95, 95, 95),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
      ),
      backgroundColor: Color(0xffEEEEEE),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Color(0xff1FFFBF),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
