import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_4/bloc/auth_bloc.dart';
import 'package:projeto_4/bloc/auth_event.dart';
import 'package:projeto_4/views/Home/book_entry.dart';
import 'package:projeto_4/views/Home/book_list.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Home Screen"),
            actions: [
              FlatButton.icon(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(Logout());
                  },
                  icon: Icon(Icons.person),
                  label: Text("logout"))
            ],
            bottom: TabBar(tabs: [
              Tab(
                  icon: Row(
                children: [Icon(Icons.announcement), Text("Lista de Livros")],
              )),
              Tab(
                  icon: Row(
                children: [Icon(Icons.cake), Text("Adicionar Livro")],
              ))
            ]),
          ),
          body: TabBarView(children: [
            BookList(),
            BookEntry(),
          ])),
    );
  }
}
