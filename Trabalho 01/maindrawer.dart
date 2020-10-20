import 'package:flutter/material.dart';
import 'main.dart';
import 'register.dart';
import 'dart:async';

class MyMainDrawer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMainDrawerPage(),
    );
  }
}

class LoginData {
  var checkboxValue = false;
  var checkboxValue1 = false;

  doSomething() {
    print("CheckBox: $checkboxValue");
  }
}

class MyMainDrawerPage extends StatefulWidget {
  final LoginData loginData = new LoginData();
  @override
  State<StatefulWidget> createState() => _MyMainDrawerPageState();
}

class _MyMainDrawerPageState extends State<MyMainDrawerPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _MyMainDrawerPageState() {
    // coloca mensagem no final da tela
    scheduleMicrotask(() => _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Hey!'), duration: Duration(seconds: 4))));
  }

  @override
  Widget build(BuildContext context) {
    //this._context = context;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Doido"),
        ),
        body: Container());
  }
}
