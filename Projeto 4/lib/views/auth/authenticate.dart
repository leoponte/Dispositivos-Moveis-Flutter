import 'package:flutter/material.dart';
import 'package:projeto_4/views/auth/register.dart';
import 'package:projeto_4/views/auth/sign_in.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Configuração de Usuários"),
            bottom: TabBar(tabs: [
              Tab(
                  icon: Row(
                children: [Icon(Icons.announcement), Text("Novo Registro")],
              )),
              Tab(
                  icon: Row(
                children: [Icon(Icons.cake), Text("Efetuar Login")],
              ))
            ]),
          ),
          body: TabBarView(children: [
            Register(),
            SignIn(),
          ])),
    );
  }
}
